import 'package:rick_and_morty_app/features/characters/domain/entities/pagination_info.dart';

class PaginationInfoModel extends PaginationInfo {
  const PaginationInfoModel({required super.count, required super.pages});

  /// Returns a [PaginationInfoModel] from the given [json].
  factory PaginationInfoModel.fromJson(Map<String, dynamic> json) {
    return PaginationInfoModel(count: json['count'], pages: json['pages']);
  }
}
