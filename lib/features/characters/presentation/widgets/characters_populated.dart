import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_item.dart';

class CharactersPopulated extends StatelessWidget {
  /// The characters.
  final List<Character> characters;

  /// Wether is loading.
  final bool isLoading;

  /// The callback to load the next page.
  final VoidCallback onLoadMore;

  /// The callback when a character is tapped.
  final void Function(Character character)? onCharacterTap;

  /// The [trailing] for each item.
  final Widget? Function(Character character)? trailing;

  const CharactersPopulated({
    super.key,
    required this.characters,
    required this.onLoadMore,
    this.isLoading = false,
    this.onCharacterTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final maxScroll = notification.metrics.maxScrollExtent;
        final currentScroll = notification.metrics.pixels;
        const delta = 200;

        if (maxScroll - currentScroll <= delta) {
          // Load next page.
          onLoadMore();
        }

        return false;
      },
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: characters.length + (isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          // Notify page loading.
          if (index == characters.length) {
            return const Center(child: CircularProgressIndicator());
          }

          final character = characters[index];

          return CharacterItem(
            character: character,
            onTap: onCharacterTap != null
                ? () => onCharacterTap!(character)
                : null,
            trailing: trailing != null ? trailing!(character) : null,
          );
        },
      ),
    );
  }
}
