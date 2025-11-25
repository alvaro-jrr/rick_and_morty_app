import 'package:rick_and_morty_app/core/db/database.dart' as db;
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';

extension CharacterStatusX on CharacterStatus {
  /// Returns the [CharacterStatus] from the given [status].
  static CharacterStatus fromString(String status) {
    return switch (status) {
      'Alive' => CharacterStatus.alive,
      'Dead' => CharacterStatus.dead,
      _ => CharacterStatus.unknown,
    };
  }

  /// Returns the [value] as string.
  String get value {
    return switch (this) {
      CharacterStatus.alive => 'Alive',
      CharacterStatus.dead => 'Dead',
      CharacterStatus.unknown => 'Unknown',
    };
  }
}

class CharacterModel extends Character {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.gender,
    required super.image,
  });

  /// Returns a [CharacterModel] from the given [json].
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: CharacterStatusX.fromString(json['status']),
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
    );
  }

  /// Returns a [CharacterModel] from the given [character].
  factory CharacterModel.fromDatabase(db.CharacterItem character) {
    return CharacterModel(
      id: character.id,
      name: character.name,
      status: CharacterStatusX.fromString(character.status),
      species: character.species,
      gender: character.gender,
      image: character.image,
    );
  }

  /// Returns a [db.CharacterItem] instance from the current model.
  db.CharacterItem toDatabase() {
    return db.CharacterItem(
      id: id,
      name: name,
      status: status.value,
      species: species,
      gender: gender,
      image: image,
    );
  }
}
