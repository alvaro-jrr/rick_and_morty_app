import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/domain/error/failures.dart';

class CharactersFailure extends StatelessWidget {
  /// The [failure].
  final Failure failure;

  /// The retry action.
  final VoidCallback onRetry;

  const CharactersFailure({super.key, Failure? failure, required this.onRetry})
    : failure = failure ?? const UnexpectedFailure();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(failure.message),
          if (failure is! NoCharactersFoundFailure) ...[
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: Text('Reintentar')),
          ],
        ],
      ),
    );
  }
}
