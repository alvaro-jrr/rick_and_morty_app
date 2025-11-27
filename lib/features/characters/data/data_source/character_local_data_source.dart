import 'package:dart_either/dart_either.dart';
import 'package:drift/drift.dart';

import 'package:rick_and_morty_app/core/db/database.dart';
import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_filter_model.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/characters/data/models/paginated_character_model.dart';
import 'package:rick_and_morty_app/features/characters/data/models/unsaved_character_model.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/pagination_info.dart';
import 'package:rick_and_morty_app/features/characters/domain/error/failures.dart';

abstract class CharacterLocalDataSource {
  /// Gets the characters that matches the [filter].
  Future<Either<Failure, PaginatedCharacterModel>> getCharacters({
    required int page,
    required int limit,
    CharacterFilterModel? filter,
  });

  /// Gets the character by [id].
  Future<Either<Failure, CharacterModel?>> getCharacterById(int id);

  /// Saves the [character].
  Future<Either<Failure, CharacterModel>> saveCharacter(
    UnsavedCharacterModel character,
  );

  /// Updates the [character].
  Future<Either<Failure, void>> updateCharacter(CharacterModel character);

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
        database.characterItems,
      )..where((c) => c.id.equals(id))).go();
    } on Exception {
      return Either.left(DeleteCharacterFailure());
    }

    return Either.right(null);
  }

  @override
  Future<Either<Failure, PaginatedCharacterModel>> getCharacters({
    required int page,
    required int limit,
    CharacterFilterModel? filter,
  }) async {
    final charactersSelect = database.select(database.characterItems);

    // Set the limit.
    charactersSelect.limit(limit, offset: page - 1);

    // Add filters.
    if (filter?.name != null) {
      charactersSelect.where((c) => c.name.like('%${filter!.name}%'));
    }

    try {
      final result = await charactersSelect.get();
      final count = await _getCount(filter) ?? 0;
      final pages = (count / limit).ceil();

      final paginatedCharacterModel = PaginatedCharacterModel(
        info: PaginationInfo(count: count, pages: pages),
        characters: result.map(CharacterModel.fromDatabase).toList(),
      );

      return Either.right(paginatedCharacterModel);
    } on Exception {
      return Either.left(GetCharactersFailure());
    }
  }

  @override
  Future<Either<Failure, CharacterModel>> saveCharacter(
    UnsavedCharacterModel character,
  ) async {
    try {
      final id = await database
          .into(database.characterItems)
          .insert(character.toDatabase(), mode: InsertMode.insertOrReplace);

      return getCharacterById(id).then((failureOrCharacter) {
        return failureOrCharacter.fold(
          ifLeft: (failure) => Either.left(failure),
          ifRight: (character) => Either.right(character!),
        );
      });
    } on Exception {
      return Either.left(SaveCharacterFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateCharacter(
    CharacterModel character,
  ) async {
    // Verify if it's saved.
    final exists = await getCharacterById(character.id).then((
      failureOrCharacter,
    ) {
      return failureOrCharacter.fold(
        ifLeft: (_) => false,
        ifRight: (character) => character != null,
      );
    });

    if (!exists) {
      return Either.left(CharacterNotFoundFailure());
    }

    // Update it.
    try {
      await (database.update(
        database.characterItems,
      )..where((c) => c.id.equals(character.id))).write(character.toDatabase());
    } catch (e) {
      return Either.left(UpdateCharacterFailure());
    }

    return Either.right(null);
  }

  @override
  Future<Either<Failure, CharacterModel?>> getCharacterById(int id) async {
    try {
      final result = await (database.select(
        database.characterItems,
      )..where((c) => c.id.equals(id))).getSingleOrNull();

      return Either.right(
        result != null ? CharacterModel.fromDatabase(result) : null,
      );
    } catch (e) {
      return Either.left(UnexpectedFailure());
    }
  }

  /// Returns the count of the characters that matches the [filter].
  Future<int?> _getCount(CharacterFilterModel? filter) {
    final count = database.characterItems.id.count(distinct: true);
    final query = database.selectOnly(database.characterItems);

    if (filter?.name != null) {
      query.where(database.characterItems.name.like('%${filter!.name}%'));
    }

    query.addColumns([count]);

    return query.map((row) => row.read(count)).getSingleOrNull();
  }
}
