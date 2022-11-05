import 'package:flutter/material.dart';
import 'package:muvees/core/models/api/tmdb/movie/movie_list.dart';
import 'package:muvees/core/models/parsed_response.dart';
import 'package:muvees/core/page_models/page_model.dart';
import 'package:muvees/core/services/api/tmdb/movie_api.dart';
import 'package:retrofit/dio.dart';

@immutable
class HomePageState {
  const HomePageState({
    this.items = const <MovieListItemType>[],
  });

  final List<MovieListItemType> items;
}

class HomePageModel extends PageStateNotifier<HomePageState> {
  HomePageModel({
    required MovieApi movieApi,
  })  : _movieApi = movieApi,
        super(const HomePageState());

  final MovieApi _movieApi;

  @override
  Future<void> initPageModel() async {
    setIsLoading(true);
    await _fetchMovieList();
    setIsLoading(false);
  }

  Future<void> _fetchMovieList() async {
    final HttpResponse<MovieListResponse> result =
        await _movieApi.getMovieListBySection(
      section: 'top_rated',
      params: MovieListParams(
        page: 1,
      ),
    );

    if (result.isSuccess) {
      state = HomePageState(
        items: result.data.results,
      );
    }
  }
}
