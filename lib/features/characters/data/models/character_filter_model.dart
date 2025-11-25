import 'package:rick_and_morty_app/features/characters/domain/entities/character_filter.dart';

class CharacterFilterModel extends CharacterFilter {
  const CharacterFilterModel({super.name});

  /// Converts to query params format.
  Map<String, String> toQueryParams() {
    return {if (name != null) 'name': name!};
  }
}
