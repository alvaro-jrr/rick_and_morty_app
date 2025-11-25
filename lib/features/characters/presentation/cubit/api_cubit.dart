import 'package:bloc/bloc.dart';

import 'package:rick_and_morty_app/features/characters/domain/entities/character_filter.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  /// The character repository.
  final CharacterRepository _characterRepository;

  ApiCubit(this._characterRepository) : super(ApiState());

  /// Fetches the characters.
  Future<void> fetchCharacters([CharacterFilter? filter]) async {
    final reset = state.filter != filter;

    if (reset) {
      // Update filter.
      emit(
        state.copyWith(
          nextPage: 1,
          filter: filter,
          status: ApiStatus.loading,
          characters: [],
        ),
      );
    }

    // Update to loading.
    if (!state.status.isLoading) {
      emit(state.copyWith(status: ApiStatus.loading));
    }

    // Fetch the list.
    final failureOrCharactersPage = await _characterRepository
        .getRemoteCharacters(page: state.nextPage, filter: filter);

    if (isClosed) return;

    failureOrCharactersPage.fold(
      ifLeft: (failure) {
        // Notify failure.
        emit(state.copyWith(failure: () => failure, status: ApiStatus.failure));
      },
      ifRight: (charactersPage) {
        final hasNextPage = state.nextPage < charactersPage.info.pages;

        // Append the characters to the current list.
        emit(
          state.copyWith(
            characters: [...state.characters, ...charactersPage.characters],
            failure: () => null,
            nextPage: hasNextPage ? state.nextPage + 1 : null,
            hasNextPage: hasNextPage,
            status: ApiStatus.success,
          ),
        );
      },
    );
  }

  /// Retries the last characters fetch when a failure occurred.
  Future<void> retry() async {
    if (state.status.isFailure || state.failure != null) {
      return fetchCharacters(state.filter);
    }
  }

  /// Loads the next page.
  Future<void> loadNextPage() async {
    if (state.status.isLoading || !state.hasNextPage) return;

    return fetchCharacters(state.filter);
  }
}
