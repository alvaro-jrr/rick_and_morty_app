import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';

class CharacterItem extends StatelessWidget {
  /// The [character] to display.
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(character.image)),
      title: Text(
        character.name,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Row(
        spacing: 4,
        children: [
          Icon(
            Icons.circle,
            size: 16,
            color: switch (character.status) {
              CharacterStatus.alive => Colors.green,
              CharacterStatus.dead => Colors.red,
              CharacterStatus.unknown => Colors.grey,
            },
          ),
          Text(character.status.label),
        ],
      ),
    );
  }
}
