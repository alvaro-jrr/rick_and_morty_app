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

  const CharactersPopulated({
    super.key,
    required this.characters,
    required this.onLoadMore,
    this.isLoading = false,
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

          return CharacterItem(character: characters[index]);
        },
      ),
    );
  }
}
