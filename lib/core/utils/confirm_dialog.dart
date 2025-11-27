import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class ConfirmDialog extends StatelessWidget {
  /// The [title].
  final String title;

  /// The action [description].
  final String? description;

  /// The callback on accept.
  final VoidCallback onAccept;

  /// The callback on cancel.
  final VoidCallback? onCancel;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.onAccept,
    this.description,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: description != null ? Text(description!) : null,
      actions: [
        TextButton(
          onPressed: () {
            // Close the dialog.
            context.pop();

            onCancel?.call();
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            // Close the dialog.
            context.pop();

            onAccept();
          },
          child: Text('OK'),
        ),
      ],
    );
  }

  /// Shows the [ConfirmDialog].
  static Future<void> show(
    BuildContext context, {
    required String title,
    String? description,
    required VoidCallback onAccept,
    VoidCallback? onCancel,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return ConfirmDialog(
          title: title,
          onAccept: onAccept,
          description: description,
          onCancel: onCancel,
        );
      },
    );
  }
}
