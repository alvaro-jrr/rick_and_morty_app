import 'dart:convert';

import 'package:dart_either/dart_either.dart';
import 'package:http/http.dart' as http;

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/data/models/character_filter_model.dart';
import 'package:rick_and_morty_app/features/characters/data/models/paginated_character_model.dart';
import 'package:rick_and_morty_app/features/characters/domain/error/failures.dart';

abstract class CharacterRemoteDataSource {
  /// Gets the characters that matches the [filter].
  Future<Either<Failure, PaginatedCharacterModel>> getCharacters({
    required int page,
    CharacterFilterModel? filter,
  });
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  /// The HTTP [client].
  final http.Client client;

  const CharacterRemoteDataSourceImpl({required this.client});

  @override
  Future<Either<Failure, PaginatedCharacterModel>> getCharacters({
    required int page,
    CharacterFilterModel? filter,
  }) async {
    try {
      final response = await client.get(
        Uri.https('rickandmortyapi.com', '/api/character', {
          'page': page.toString(),
          if (filter != null) ...filter.toQueryParams(),
        }),
      );

      // Handle when no characters were found.
      if (response.statusCode != 200) {
        return Either.left(NoCharactersFoundFailure());
      }

      final decodedResponse = jsonDecode(response.body);

      final paginatedCharacter = PaginatedCharacterModel.fromJson(
        decodedResponse,
      );

      return Either.right(paginatedCharacter);
    } catch (e) {
      return Either.left(GetCharactersFailure());
    }
  }
}
