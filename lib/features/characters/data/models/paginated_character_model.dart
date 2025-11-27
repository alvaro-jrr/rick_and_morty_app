import 'package:rick_and_morty_app/features/characters/data/models/character_model.dart';
import 'package:rick_and_morty_app/features/characters/data/models/pagination_info_model.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/paginated_character.dart';

class PaginatedCharacterModel extends PaginatedCharacter {
  const PaginatedCharacterModel({
    required super.info,
    required super.characters,
  });

  /// Returns a [PaginatedCharacterModel] from the given [json].
  factory PaginatedCharacterModel.fromJson(Map<String, dynamic> json) {
    return PaginatedCharacterModel(
      info: PaginationInfoModel.fromJson(json['info']),
      characters: (json['results'] as List)
          .map((character) => CharacterModel.fromJson(character))
          .toList(),
    );
  }
}
