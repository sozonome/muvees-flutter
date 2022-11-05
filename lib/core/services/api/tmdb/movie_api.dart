import 'package:dio/dio.dart';
import 'package:muvees/core/models/api/tmdb/movie/movie_list.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api.g.dart';

@RestApi()
abstract class MovieApi {
  factory MovieApi(Dio dio, {String? baseUrl}) = _MovieApi;

  @GET('/movie/{section}')
  Future<HttpResponse<MovieListResponse>> getMovieListBySection({
    @Path() required String section,
    @Queries() required MovieListParams params,
  });
}
