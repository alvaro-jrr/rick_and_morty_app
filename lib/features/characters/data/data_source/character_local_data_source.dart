import 'package:dart_either/dart_either.dart';

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_query.dart';

abstract class CharacterLocalDataSource {
  /// Gets the characters that matches the [query].
  Future<Either<Failure, List<CharacterModel>>> getCharacters(
    CharacterQuery query,
  );

  /// Saves the [character].
  Future<Either<Failure, void>> saveCharacter(CharacterModel character);

  /// Removes the character with the given [id].
  Future<Either<Failure, void>> deleteCharacter(int id);
}
