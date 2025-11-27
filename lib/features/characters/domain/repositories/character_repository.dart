import 'package:dart_either/dart_either.dart';

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_filter.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/paginated_character.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/unsaved_character.dart';

abstract class CharacterRepository {
  /// Gets the characters remotely that matches the [filter]
  Future<Either<Failure, PaginatedCharacter>> getRemoteCharacters({
    int page,
    CharacterFilter? filter,
  });

  /// Gets the characters stored locally that matches the [filter].
  Future<Either<Failure, PaginatedCharacter>> getLocalCharacters({
    int page,
    int limit,
    CharacterFilter? filter,
  });

  /// Saves the [character].
  Future<Either<Failure, Character>> saveCharacter(UnsavedCharacter character);

  /// Updates the [character].
  Future<Either<Failure, void>> updateCharacter(Character character);

  /// Deletes a character by [id].
  Future<Either<Failure, void>> deleteCharacter(int id);

  /// Gets the character by ID.
  Future<Either<Failure, Character?>> getLocalCharacterById(int id);
}
