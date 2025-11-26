import 'package:flutter/material.dart';

class CharactersEmpty extends StatelessWidget {
  /// The [message] on empty state.
  final String message;

  const CharactersEmpty({super.key, this.message = ''});

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) return SizedBox();

    return Center(child: Text(message));
  }
}
