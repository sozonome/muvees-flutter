import 'package:dio/dio.dart';
import 'package:muvees/core/constants/env.dart';
import 'package:muvees/core/models/fetcher.dart';

Dio tmdbFetcher = Fetcher(
  options: BaseOptions(
    baseUrl: Env.tmdbApiUrl,
    queryParameters: <String, dynamic>{
      'api_key': Env.tmdbApiKey,
    },
  ),
).dioFetcher;
