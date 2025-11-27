import 'package:equatable/equatable.dart';

import 'package:rick_and_morty_app/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty_app/features/characters/domain/entities/pagination_info.dart';

class PaginatedCharacter extends Equatable {
  /// The pagination [info].
  final PaginationInfo info;

  /// The list of [characters].
  final List<Character> characters;

  const PaginatedCharacter({required this.info, required this.characters});

  @override
  List<Object?> get props => [info, characters];
}
