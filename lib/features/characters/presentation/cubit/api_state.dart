import 'package:equatable/equatable.dart';

import 'package:rick_and_morty_app/core/error/failures.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/character_filter.dart';

enum ApiStatus {
  initial,
  loading,
  success,
  failure;

  /// Wether the status is [initial].
  bool get isInitial => this == ApiStatus.initial;

  /// Wether the status is [loading].
  bool get isLoading => this == ApiStatus.loading;

  /// Wether the status is [success].
  bool get isSuccess => this == ApiStatus.success;

  /// Wether the status is [failure].
  bool get isFailure => this == ApiStatus.failure;
}

class ApiState extends Equatable {
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
  final ApiStatus status;

  const ApiState({
    this.nextPage = 1,
    this.hasNextPage = true,
    this.characters = const [],
    this.failure,
    this.filter,
    this.status = ApiStatus.initial,
  });

  /// Returns an [ApiState] copy with the given values.
  ApiState copyWith({
    int? nextPage,
    bool? hasNextPage,
    List<Character>? characters,
    Failure? Function()? failure,
    CharacterFilter? filter,
    ApiStatus? status,
  }) {
    return ApiState(
      nextPage: nextPage ?? this.nextPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      characters: characters ?? this.characters,
      failure: failure != null ? failure.call() : this.failure,
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
