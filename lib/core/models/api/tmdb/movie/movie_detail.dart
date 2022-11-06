import 'package:json_annotation/json_annotation.dart';

part 'movie_detail.g.dart';

/// Quickly generated and modified from https://app.quicktype.io/
/// and https://developers.themoviedb.org/3/movies/get-movie-details

@JsonSerializable()
class MovieDetailResponse {
  MovieDetailResponse({
    required this.budget,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    this.adult = false,
    this.video = false,
    this.genres = const <Genre>[],
    this.productionCompanies = const <ProductionCompany>[],
    this.productionCountries = const <ProductionCountry>[],
    this.spokenLanguages = const <SpokenLanguage>[],
    this.backdropPath,
    this.belongsToCollection,
    this.homepage,
    this.imdbId,
    this.posterPath,
    this.tagline,
  });

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);

  bool adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  Object? belongsToCollection;
  int budget;
  List<Genre> genres;
  String? homepage;
  int id;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry> productionCountries;
  @JsonKey(name: 'release_date')
  DateTime releaseDate;
  int revenue;
  int runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage> spokenLanguages;
  String status;
  String? tagline;
  String title;
  bool video;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}

@JsonSerializable()
class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  int id;
  String name;

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.name,
    required this.originCountry,
    this.logoPath,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  int id;
  @JsonKey(name: 'logo_path')
  String? logoPath;
  String name;
  @JsonKey(name: 'origin_country')
  String originCountry;

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);

  @JsonKey(name: 'iso_3166_1')
  String iso31661;
  String name;

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  SpokenLanguage({
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  @JsonKey(name: 'iso_639_1')
  String iso6391;
  String name;

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
