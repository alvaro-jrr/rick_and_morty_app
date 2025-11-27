import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_avatar.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_status_icon.dart';

class CharacterDetail extends StatelessWidget {
  /// The [character].
  final Character character;

  const CharacterDetail({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final descriptionIconColor = theme.colorScheme.primary;

    return SingleChildScrollView(
      padding: EdgeInsetsGeometry.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CharacterAvatar(image: character.image, size: screenWidth * 0.4),
          const SizedBox(height: 16.0),
          Text(
            character.name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: theme.textTheme.headlineMedium?.fontSize,
            ),
          ),
          const SizedBox(height: 24.0),
          CharacterDescriptionItem(
            leading: Icon(Icons.male, color: descriptionIconColor),
            title: 'Género',
            content: character.gender,
          ),
          const SizedBox(height: 16.0),
          CharacterDescriptionItem(
            leading: Icon(Icons.person, color: descriptionIconColor),
            title: 'Especie',
            content: character.species,
          ),
          const SizedBox(height: 16.0),
          CharacterDescriptionItem(
            leading: CharacterStatusIcon(status: character.status),
            title: 'Estatus',
            content: character.status.label,
          ),
        ],
      ),
    );
  }
}

class CharacterDescriptionItem extends StatelessWidget {
  /// The description [title].
  final String title;

  /// The description [content].
  final String content;

  /// The leading widget.
  final Widget? leading;

  const CharacterDescriptionItem({
    super.key,
    required this.title,
    required this.content,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.0,
      children: [
        if (leading != null) leading!,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.0,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
              Text(
                content,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
