import 'package:rick_and_morty_app/features/characters/domain/entities/unsaved_character.dart';

class Character extends UnsavedCharacter {
  /// The character [id].
  final int id;

  const Character({
    required this.id,
    required super.name,
    required super.status,
    required super.species,
    required super.gender,
    required super.image,
  });

  @override
  List<Object?> get props => [id, ...super.props];
}
