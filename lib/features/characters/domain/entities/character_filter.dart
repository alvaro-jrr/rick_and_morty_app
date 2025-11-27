import 'package:equatable/equatable.dart';

class CharacterFilter extends Equatable {
  /// The [name] to search.
  final String? name;

  const CharacterFilter({required this.name});

  @override
  List<Object?> get props => [name];
}
