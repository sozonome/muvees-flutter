import 'package:json_annotation/json_annotation.dart';

part 'movie_list.g.dart';

@JsonSerializable()
class MovieListParams {
  MovieListParams({
    this.language,
    this.page,
    this.query,
    this.withGenres,
  });

  factory MovieListParams.fromJson(Map<String, dynamic> json) =>
      _$MovieListParamsFromJson(json);

  String? language;
  int? page;
  String? query;
  @JsonKey(name: 'with_genres')
  List<String>? withGenres;

  Map<String, dynamic> toJson() => _$MovieListParamsToJson(this);
}

@JsonSerializable()
class MovieListItemType {
  const MovieListItemType({
    required this.releaseDate,
    required this.id,
    required this.popularity,
    this.posterPath,
    this.adult = false,
    this.overview = '',
    this.genreIDs = const <int>[],
    this.originalTitle = '',
    this.originalLanguage = '',
    this.title = '',
    this.backdropPath,
    this.voteCount = 0,
    this.video = false,
    this.voteAverage = 0,
  });

  factory MovieListItemType.fromJson(Map<String, dynamic> json) =>
      _$MovieListItemTypeFromJson(json);

  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final bool adult;
  final String overview;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  @JsonKey(name: 'genre_ids')
  final List<int> genreIDs;
  final int id;

  @JsonKey(name: 'original_title')
  final String originalTitle;

  @JsonKey(name: 'original_language')
  final String originalLanguage;
  final String title;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  final int popularity;

  @JsonKey(name: 'vote_count')
  final int voteCount;
  final bool video;

  @JsonKey(name: 'vote_average')
  final int voteAverage;

  Map<String, dynamic> toJson() => _$MovieListItemTypeToJson(this);
}
