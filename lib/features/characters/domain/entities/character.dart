import 'package:equatable/equatable.dart';

enum CharacterStatus {
  alive,
  dead,
  unknown;

  /// Returns the [label].
  String get label {
    return switch (this) {
      CharacterStatus.alive => 'Vivo',
      CharacterStatus.dead => 'Muerto',
      CharacterStatus.unknown => 'Desconocido',
    };
  }

  /// Wether the character is [alive].
  bool isAlive() => this == CharacterStatus.alive;

  /// Wether the character is [dead].
  bool isDead() => this == CharacterStatus.dead;

  /// Wether the character status is [unknown].
  bool isUnknown() => this == CharacterStatus.unknown;
}

class Character extends Equatable {
  /// The character [id].
  final int id;

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

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, status, species, gender, image];
}
