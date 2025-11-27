import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  /// The time in milliseconds to wait.
  final int milliseconds;

  /// The timer to debounce.
  Timer? _timer;

  Debouncer({required this.milliseconds});

  /// Runs the [action] when the timer has been completed without any new events occurring.
  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
