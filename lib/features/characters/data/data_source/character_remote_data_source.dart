import 'package:dart_either/dart_either.dart';

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_query.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/paginated_character.dart';

abstract class CharacterRemoteDataSource {
  /// Gets the characters that matches the [query].
  Future<Either<Failure, PaginatedCharacter>> getCharacters(
    CharacterQuery query,
  );
}
