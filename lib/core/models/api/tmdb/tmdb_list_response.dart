import 'package:json_annotation/json_annotation.dart';

part 'tmdb_list_response.g.dart';

@JsonSerializable()
class TmdbListResponse {
  TmdbListResponse({
    required this.page,
    required this.totalResults,
    required this.totalPages,
  });

  factory TmdbListResponse.fromJson(Map<String, dynamic> json) =>
      _$TmdbListResponseFromJson(json);

  final int page;
  @JsonKey(name: 'total_results')
  final int totalResults;
  @JsonKey(name: 'total_pages')
  final int totalPages;

  Map<String, dynamic> toJson() => _$TmdbListResponseToJson(this);
}
