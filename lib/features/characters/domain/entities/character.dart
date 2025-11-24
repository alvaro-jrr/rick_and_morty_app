import 'package:equatable/equatable.dart';

class Character extends Equatable {
  /// The character [id].
  final int id;

  /// The character [name].
  final String name;

  /// The character [status].
  final String status;

  /// The character [species].
  final String species;

  /// The character [gender].
  final String gender;

  /// The character [image].
  final String image;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, status, species, gender, image];
}
