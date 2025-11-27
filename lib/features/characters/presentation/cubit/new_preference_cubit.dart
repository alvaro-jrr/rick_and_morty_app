import 'package:bloc/bloc.dart';

import 'package:rick_and_morty_app/features/characters/domain/entities/unsaved_character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';
import 'package:rick_and_morty_app/features/characters/presentation/cubit/new_preference_state.dart';

class NewPreferenceCubit extends Cubit<NewPreferenceState> {
  /// The character repository.
  final CharacterRepository _characterRepository;

  NewPreferenceCubit(this._characterRepository) : super(NewPreferenceState());

  /// Saves the character.
  Future<void> saveCharacter(UnsavedCharacter newCharacter) async {
    final failureOrCharacter = await _characterRepository.saveCharacter(
      newCharacter,
    );

    return failureOrCharacter.fold(
      ifLeft: (failure) {
        emit(
          state.copyWith(
            failure: () => failure,
            status: NewPreferenceStatus.failure,
          ),
        );
      },
      ifRight: (character) {
        emit(
          state.copyWith(
            character: character,
            status: NewPreferenceStatus.success,
            failure: () => null,
          ),
        );
      },
    );
  }
}
