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
