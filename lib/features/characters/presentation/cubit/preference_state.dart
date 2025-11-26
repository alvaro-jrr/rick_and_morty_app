import 'package:equatable/equatable.dart';

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_filter.dart';

enum PreferenceStatus {
  initial,
  loading,
  success,
  failure;

  /// Wether the status is [initial].
  bool get isInitial => this == PreferenceStatus.initial;

  /// Wether the status is [loading].
  bool get isLoading => this == PreferenceStatus.loading;

  /// Wether the status is [success].
  bool get isSuccess => this == PreferenceStatus.success;

  /// Wether the status is [failure].
  bool get isFailure => this == PreferenceStatus.failure;
}

class PreferenceState extends Equatable {
  /// The next page number.
  final int nextPage;

  /// Wether there's a next page.
  final bool hasNextPage;

  /// The [characters] list.
  final List<Character> characters;

  /// The [failure] for the latest call.
  final Failure? failure;

  /// The filter used to fetch the list.
  final CharacterFilter? filter;

  /// The current [status].
  final PreferenceStatus status;

  const PreferenceState({
    this.nextPage = 1,
    this.hasNextPage = true,
    this.characters = const [],
    this.failure,
    this.filter,
    this.status = PreferenceStatus.initial,
  });

  /// Returns an [PreferenceState] copy with the given values.
  PreferenceState copyWith({
    int? nextPage,
    bool? hasNextPage,
    List<Character>? characters,
    Failure? Function()? failure,
    CharacterFilter? filter,
    PreferenceStatus? status,
  }) {
    return PreferenceState(
      nextPage: nextPage ?? this.nextPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      characters: characters ?? this.characters,
      failure: failure != null ? failure() : this.failure,
      filter: filter ?? this.filter,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    nextPage,
    hasNextPage,
    characters,
    failure,
    filter,
    status,
  ];
}
