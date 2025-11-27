import 'package:drift/drift.dart';

import 'package:rick_and_morty_app/core/db/database.dart' as db;
import 'package:rick_and_morty_app/features/characters/data/models/character_status_model.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';

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

  /// Returns an insertable instance from the current model.
  Insertable<db.CharacterItem> toDatabase() {
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
