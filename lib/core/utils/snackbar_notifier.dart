import 'package:flutter/material.dart';

class SnackbarNotifier {
  /// Creates a success [SnackBar].
  static void success(BuildContext context, {required String message}) {
    _notify(
      context,
      message: message,
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    );
  }

  /// Creates an error [SnackBar].
  static void error(BuildContext context, {required String message}) {
    _notify(
      context,
      message: message,
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    );
  }

  /// Creates an informative [SnackBar].
  static void info(BuildContext context, {required String message}) {
    _notify(context, message: message);
  }

  /// Notifies the given [message].
  static void _notify(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;

    messenger.showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: foregroundColor)),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
