import 'package:dart_either/dart_either.dart';

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/data/data_source/character_local_data_source.dart';
import 'package:rick_and_morty_app/features/characters/data/data_source/character_remote_data_source.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_query_model.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_query.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/paginated_character.dart';
import 'package:rick_and_morty_app/features/characters/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  /// The local data source.
  final CharacterLocalDataSource localDataSource;

  /// The remote data source.
  final CharacterRemoteDataSource remoteDataSource;

  const CharacterRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, void>> deleteCharacter(int id) {
    return localDataSource.deleteCharacter(id);
  }

  @override
  Future<Either<Failure, List<Character>>> getLocalCharacters(
    CharacterQuery? query,
  ) {
    final queryModel = query != null
        ? CharacterQueryModel(
            name: query.name,
            limit: query.limit,
            page: query.page,
          )
        : CharacterQueryModel();

    return localDataSource.getCharacters(queryModel);
  }

  @override
  Future<Either<Failure, PaginatedCharacter>> getRemoteCharacters(
    CharacterQuery? query,
  ) {
    final queryModel = query != null
        ? CharacterQueryModel(
            name: query.name,
            limit: query.limit,
            page: query.page,
          )
        : CharacterQueryModel();

    return remoteDataSource.getCharacters(queryModel);
  }

  @override
  Future<Either<Failure, void>> saveCharacter(Character character) {
    final characterModel = CharacterModel(
      id: character.id,
      name: character.name,
      status: character.status,
      species: character.species,
      gender: character.gender,
      image: character.image,
    );

    return localDataSource.saveCharacter(characterModel);
  }
}
