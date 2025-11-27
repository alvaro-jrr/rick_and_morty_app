import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_status.dart';

class CharacterStatusIcon extends StatelessWidget {
  /// The character [status].
  final CharacterStatus status;

  /// The [size] of the icon.
  final double? size;

  const CharacterStatusIcon({super.key, required this.status, this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      color: switch (status) {
        CharacterStatus.alive => Colors.green,
        CharacterStatus.dead => Colors.red,
        CharacterStatus.unknown => Colors.grey,
      },
    );
  }
}
