import 'package:equatable/equatable.dart';

class PaginationInfo extends Equatable {
  /// The total items [count].
  final int count;

  /// The total [pages].
  final int pages;

  const PaginationInfo({required this.count, required this.pages});

  @override
  List<Object?> get props => [count, pages];
}
