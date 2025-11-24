import 'package:rick_and_morty_app/features/characters/domain/entities/character_query.dart';

class CharacterQueryModel extends CharacterQuery {
  const CharacterQueryModel({super.name, super.limit, super.page});

  /// Converts to query params format.
  Map<String, String> toQueryParams() {
    return {'name': name, 'limit': limit.toString(), 'page': page.toString()};
  }
}
