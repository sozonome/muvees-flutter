// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListParams _$MovieListParamsFromJson(Map<String, dynamic> json) =>
    MovieListParams(
      language: json['language'] as String?,
      page: json['page'] as int?,
      query: json['query'] as String?,
      withGenres: (json['with_genres'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MovieListParamsToJson(MovieListParams instance) =>
    <String, dynamic>{
      'language': instance.language,
      'page': instance.page,
      'query': instance.query,
      'with_genres': instance.withGenres,
    };

MovieListItemType _$MovieListItemTypeFromJson(Map<String, dynamic> json) =>
    MovieListItemType(
      releaseDate: json['release_date'] as String,
      id: json['id'] as int,
      popularity: json['popularity'] as int,
      posterPath: json['poster_path'] as String?,
      adult: json['adult'] as bool? ?? false,
      overview: json['overview'] as String? ?? '',
      genreIDs: (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const <int>[],
      originalTitle: json['original_title'] as String? ?? '',
      originalLanguage: json['original_language'] as String? ?? '',
      title: json['title'] as String? ?? '',
      backdropPath: json['backdrop_path'] as String?,
      voteCount: json['vote_count'] as int? ?? 0,
      video: json['video'] as bool? ?? false,
      voteAverage: json['vote_average'] as int? ?? 0,
    );

Map<String, dynamic> _$MovieListItemTypeToJson(MovieListItemType instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'genre_ids': instance.genreIDs,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'original_language': instance.originalLanguage,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.voteAverage,
    };
