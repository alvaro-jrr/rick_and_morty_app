import 'package:drift/drift.dart';
import 'package:rick_and_morty_app/core/db/database.dart' as db;
import 'package:rick_and_morty_app/features/characters/data/models/character_status_model.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/unsaved_character.dart';

class UnsavedCharacterModel extends UnsavedCharacter {
  const UnsavedCharacterModel({
    required super.name,
    required super.status,
    required super.species,
    required super.gender,
    required super.image,
  });

  /// Returns an insertable  from the current model.
  Insertable<db.CharacterItem> toDatabase() {
    return db.CharacterItemsCompanion.insert(
      name: name,
      status: status.value,
      species: species,
      gender: gender,
      image: image,
    );
  }
}
