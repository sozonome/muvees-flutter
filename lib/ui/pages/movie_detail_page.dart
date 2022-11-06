import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:muvees/core/models/api/tmdb/movie/movie_detail.dart';
import 'package:muvees/core/page_models/movie_detail_page_model.dart';
import 'package:muvees/core/services/api/tmdb/fetchers.dart';
import 'package:muvees/ui/page_model_consumer.dart';
import 'package:muvees/ui/widgets/shared/poster_image.dart';

class MovieDetailPageParams {
  const MovieDetailPageParams({
    this.id = 0,
  });

  final int id;
}

StateNotifierProvider<MovieDetailPageModel, MovieDetailPageState>
    movieDetailPageModel({
  required int movieId,
}) {
  return StateNotifierProvider<MovieDetailPageModel, MovieDetailPageState>(
    (
      StateNotifierProviderRef<MovieDetailPageModel, MovieDetailPageState> ref,
    ) {
      return MovieDetailPageModel(
        movieApi: ref.read(movieApiProvider),
        movieId: movieId,
      );
    },
  );
}

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({
    required this.params,
    Key? key,
  }) : super(key: key);

  final MovieDetailPageParams params;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  StateNotifierProvider<MovieDetailPageModel, MovieDetailPageState> pageModel =
      movieDetailPageModel(movieId: 0);

  @override
  void initState() {
    super.initState();
    pageModel = movieDetailPageModel(movieId: widget.params.id);
  }

  @override
  Widget build(BuildContext context) {
    return PageModelConsumer<MovieDetailPageModel, MovieDetailPageState>(
      pageModel: pageModel,
      onModelReady: (MovieDetailPageModel model) async {
        await model.initPageModel();
      },
      builder: (
        BuildContext context,
        MovieDetailPageState state,
        MovieDetailPageModel notifier,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.data?.title == null
                  ? 'Movie Detail (loading...)'
                  : (state.data?.title ?? ''),
            ),
          ),
          body: notifier.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _MovieDetailContent(data: state.data),
        );
      },
    );
  }
}

class _MovieDetailContent extends StatelessWidget {
  const _MovieDetailContent({
    this.data,
  });

  final MovieDetailResponse? data;

  @override
  Widget build(BuildContext context) {
    final MovieDetailResponse? movie = data;
    if (movie == null) {
      return const SizedBox.shrink();
    }

    final String? posterPath = movie.posterPath;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (posterPath != null)
              SizedBox(
                width: 250,
                child: PosterImage(
                  imagePath: posterPath,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Released: ${DateFormat('dd MMMM yyyy').format(movie.releaseDate.toLocal())}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: movie.genres
                  .map(
                    (Genre genre) => Container(
                      padding: const EdgeInsets.only(right: 4),
                      child: Chip(
                        label: Text(
                          genre.name,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            Text(
              movie.overview,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
