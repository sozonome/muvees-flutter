import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';

class Fetcher with UiLoggy {
  Fetcher({
    this.options,
  });

  final BaseOptions? options;

  Dio get dioFetcher {
    return Dio(options);
  }
}
