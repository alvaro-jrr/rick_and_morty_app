import 'package:dart_either/dart_either.dart';

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_query.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/paginated_character.dart';

abstract class CharacterRepository {
  /// Gets the characters remotely that matches the [query]
  Future<Either<Failure, PaginatedCharacter>> getRemoteCharacters(
    CharacterQuery? query,
  );

  /// Gets the characters stored locally that matches the [query].
  Future<Either<Failure, List<Character>>> getLocalCharacters(
    CharacterQuery? query,
  );

  /// Saves the [character].
  Future<Either<Failure, void>> saveCharacter(Character character);

  /// Deletes a character by [id].
  Future<Either<Failure, void>> deleteCharacter(int id);
}
