import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muvees/core/config/routes/routes.dart';
import 'package:muvees/core/models/api/tmdb/movie/movie_list.dart';
import 'package:muvees/core/page_models/home_page_model.dart';
import 'package:muvees/core/services/api/tmdb/fetchers.dart';
import 'package:muvees/ui/page_model_consumer.dart';
import 'package:muvees/ui/pages/movie_detail_page.dart';
import 'package:muvees/ui/widgets/shared/poster_card.dart';

class MyHomePageParams {
  const MyHomePageParams({
    this.title = '',
    this.isDeepLink = false,
  });

  final String title;
  final bool isDeepLink;
}

final StateNotifierProvider<HomePageModel, HomePageState> homePageModel =
    StateNotifierProvider<HomePageModel, HomePageState>(
  (StateNotifierProviderRef<HomePageModel, HomePageState> ref) {
    return HomePageModel(
      movieApi: ref.read(movieApiProvider),
    );
  },
);

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    required this.params,
    Key? key,
  }) : super(key: key);

  final MyHomePageParams params;

  @override
  Widget build(BuildContext context) {
    return PageModelConsumer<HomePageModel, HomePageState>(
      pageModel: homePageModel,
      onModelReady: (HomePageModel model) async {
        await model.initPageModel();
      },
      builder: (
        BuildContext context,
        HomePageState state,
        HomePageModel notifier,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('muvees'),
          ),
          body: notifier.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: _MovieGrid(
                        movies: state.items,
                        onTapMovie: (int id) => _openMovieDetail(
                          context: context,
                          id: id,
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  void _openMovieDetail({
    required BuildContext context,
    required int id,
  }) {
    context.pushNamed(
      AppRoute.movieDetail,
      extra: MovieDetailPageParams(id: id),
    );
  }
}

class _MovieGrid extends StatelessWidget {
  const _MovieGrid({
    required this.movies,
    required this.onTapMovie,
    Key? key,
  }) : super(key: key);

  final List<MovieListItemType> movies;
  final void Function(int id) onTapMovie;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      mainAxisSpacing: 24,
      crossAxisSpacing: 24,
      childAspectRatio: 3 / 4,
      children: List<Widget>.generate(
        movies.length,
        (int index) {
          return GestureDetector(
            onTap: () => onTapMovie(movies[index].id),
            child: _MovieCard(movie: movies[index]),
          );
        },
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  const _MovieCard({
    required this.movie,
    Key? key,
  }) : super(key: key);

  final MovieListItemType movie;

  @override
  Widget build(BuildContext context) {
    return PosterCard(
      name: movie.title,
      imageUrl: movie.posterPath,
    );
  }
}
