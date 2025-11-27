import 'package:bloc/bloc.dart';

import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/get_preference_detail_state.dart';

class GetPreferenceDetailCubit extends Cubit<GetPreferenceDetailState> {
  /// The character repository.
  final CharacterRepository _characterRepository;

  GetPreferenceDetailCubit(this._characterRepository)
    : super(GetPreferenceDetailState());

  /// Fetches the character by ID.
  Future<void> getCharacterById(int id) async {
    // Notify loading.
    emit(state.copyWith(status: GetPreferenceDetailStatus.loading));

    // Get character.
    final failureOrCharacter = await _characterRepository.getLocalCharacterById(
      id,
    );

    failureOrCharacter.fold(
      ifLeft: (failure) {
        emit(
          state.copyWith(
            status: GetPreferenceDetailStatus.failure,
            failure: () => failure,
          ),
        );
      },
      ifRight: (character) {
        emit(
          state.copyWith(
            status: GetPreferenceDetailStatus.success,
            character: character,
          ),
        );
      },
    );
  }
}
