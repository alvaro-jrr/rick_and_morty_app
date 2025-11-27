import 'package:equatable/equatable.dart';

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';

enum NewPreferenceStatus { initial, success, failure }

class NewPreferenceState extends Equatable {
  /// The new preference status.
  final NewPreferenceStatus status;

  /// The failure for the latest call.
  final Failure? failure;

  /// The saved [character].
  final Character? character;

  const NewPreferenceState({
    this.status = NewPreferenceStatus.initial,
    this.failure,
    this.character,
  });

  /// Returns a [NewPreferenceState] copy with the given values.
  NewPreferenceState copyWith({
    NewPreferenceStatus? status,
    Failure? Function()? failure,
    Character? character,
  }) {
    return NewPreferenceState(
      status: status ?? this.status,
      failure: failure != null ? failure.call() : this.failure,
      character: character ?? this.character,
    );
  }

  @override
  List<Object?> get props => [status, failure, character];
}
