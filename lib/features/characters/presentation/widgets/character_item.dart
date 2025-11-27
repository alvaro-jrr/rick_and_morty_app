import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_status_icon.dart';

class CharacterItem extends StatelessWidget {
  /// The [character] to display.
  final Character character;

  /// The callback when the [character] is tapped.
  final VoidCallback? onTap;

  /// The [trailing] widget.
  final Widget? trailing;

  const CharacterItem({
    super.key,
    required this.character,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(character.image)),
      title: Text(
        character.name,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
      subtitle: Row(
        spacing: 4,
        children: [
          CharacterStatusIcon(status: character.status, size: 16.0),
          Text(character.status.label),
        ],
      ),
      trailing: trailing,
    );
  }
}
