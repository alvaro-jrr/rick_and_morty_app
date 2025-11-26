import 'package:equatable/equatable.dart';

import 'package:rick_and_morty_app/features/characters/domain/entities/character_status.dart';

class UnsavedCharacter extends Equatable {
  /// The character [name].
  final String name;

  /// The character [status].
  final CharacterStatus status;

  /// The character [species].
  final String species;

  /// The character [gender].
  final String gender;

  /// The character [image].
  final String image;

  const UnsavedCharacter({
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  @override
  List<Object?> get props => [name, status, species, gender, image];
}
