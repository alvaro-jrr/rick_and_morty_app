import 'package:equatable/equatable.dart';

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';

enum GetPreferenceDetailStatus { initial, loading, success, failure }

class GetPreferenceDetailState extends Equatable {
  /// The fetched [character].
  final Character? character;

  /// The latest call [failure].
  final Failure? failure;

  /// The status.
  final GetPreferenceDetailStatus status;

  const GetPreferenceDetailState({
    this.character,
    this.failure,
    this.status = GetPreferenceDetailStatus.initial,
  });

  /// Returns a [GetPreferenceDetailState] copy with the given values.
  GetPreferenceDetailState copyWith({
    Character? character,
    Failure? Function()? failure,
    GetPreferenceDetailStatus? status,
  }) {
    return GetPreferenceDetailState(
      character: character ?? this.character,
      failure: failure != null ? failure() : this.failure,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [character, failure, status];
}
