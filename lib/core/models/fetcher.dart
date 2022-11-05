import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Fetcher with UiLoggy {
  Fetcher({
    this.options,
  });

  final BaseOptions? options;

  Dio get dioFetcher {
    return Dio(options)
      ..interceptors.addAll(
        <Interceptor>[
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            error: true,
            request: true,
            responseHeader: true,
          )
        ],
      );
  }
}
