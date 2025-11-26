import 'package:rick_and_morty_app/features/characters/domain/entities/character_status.dart';

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
