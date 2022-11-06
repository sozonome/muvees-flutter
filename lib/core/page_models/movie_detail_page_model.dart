import 'package:flutter/material.dart';
import 'package:muvees/core/models/api/tmdb/movie/movie_detail.dart';
import 'package:muvees/core/models/parsed_response.dart';
import 'package:muvees/core/page_models/page_model.dart';
import 'package:muvees/core/services/api/tmdb/movie_api.dart';
import 'package:retrofit/dio.dart';

@immutable
class MovieDetailPageState {
  const MovieDetailPageState({
    this.data,
  });

  final MovieDetailResponse? data;
}

class MovieDetailPageModel extends PageStateNotifier<MovieDetailPageState> {
  MovieDetailPageModel({
    required MovieApi movieApi,
    required int movieId,
  })  : _movieApi = movieApi,
        _movieId = movieId,
        super(const MovieDetailPageState());

  final MovieApi _movieApi;
  final int _movieId;

  @override
  Future<void> initPageModel() async {
    setIsLoading(true);
    await _fetchMovieDetail();
    setIsLoading(false);
  }

  Future<void> _fetchMovieDetail() async {
    final HttpResponse<MovieDetailResponse> result =
        await _movieApi.getMovieDetail(movieId: _movieId);

    if (result.isSuccess) {
      state = MovieDetailPageState(data: result.data);
    }
  }
}
