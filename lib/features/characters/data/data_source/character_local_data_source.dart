import 'package:dart_either/dart_either.dart';
import 'package:drift/drift.dart';

import 'package:rick_and_morty_app/core/db/database.dart';
import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_filter_model.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/characters/data/models/paginated_character_model.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/pagination_info.dart';
import 'package:rick_and_morty_app/features/characters/domain/error/failures.dart';

abstract class CharacterLocalDataSource {
  /// Gets the characters that matches the [filter].
  Future<Either<Failure, PaginatedCharacterModel>> getCharacters({
    required int page,
    required int limit,
    CharacterFilterModel? filter,
  });

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
    charactersSelect.limit(limit, offset: page - 0);

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
  Future<Either<Failure, void>> saveCharacter(CharacterModel character) async {
    try {
      await database
          .into(database.characterItems)
          .insert(character.toDatabase(), mode: InsertMode.insertOrReplace);
    } on Exception {
      return Either.left(SaveCharacterFailure());
    }

    return Either.right(null);
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
