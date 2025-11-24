import 'package:dart_either/dart_either.dart';
import 'package:drift/drift.dart';

import 'package:rick_and_morty_app/core/db/database.dart';
import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_query_model.dart';
import 'package:rick_and_morty_app/features/characters/domain/errors/failures.dart';

abstract class CharacterLocalDataSource {
  /// Gets the characters that matches the [query].
  Future<Either<Failure, List<CharacterModel>>> getCharacters(
    CharacterQueryModel query,
  );

  /// Saves the [character].
  Future<Either<Failure, void>> saveCharacter(CharacterModel character);

  /// Removes the character with the given [id].
  Future<Either<Failure, void>> deleteCharacter(int id);
}

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  /// The app [database].
  final AppDatabase database;

  CharacterLocalDataSourceImpl({required this.database});

  @override
  Future<Either<Failure, void>> deleteCharacter(int id) async {
    try {
      await (database.delete(
        database.characters,
      )..where((c) => c.id.equals(id))).go();
    } on Exception {
      return Either.left(DeleteCharacterFailure());
    }

    return Either.right(null);
  }

  @override
  Future<Either<Failure, List<CharacterModel>>> getCharacters(
    CharacterQueryModel query,
  ) async {
    final charactersSelect = database.select(database.characters);

    // Set the limit.
    charactersSelect.limit(query.limit, offset: query.page - 0);

    // Add filters.
    if (query.name.isNotEmpty) {
      charactersSelect.where((c) => c.name.like('%${query.name}%'));
    }

    try {
      final result = await charactersSelect.get();

      return Either.right(result.map(CharacterModel.fromDatabase).toList());
    } on Exception {
      return Either.left(GetCharactersFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveCharacter(CharacterModel character) async {
    try {
      await database
          .into(database.characters)
          .insert(character.toDatabase(), mode: InsertMode.insertOrReplace);
    } on Exception {
      return Either.left(SaveCharacterFailure());
    }

    return Either.right(null);
  }
}
