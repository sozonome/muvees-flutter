import 'dart:io';

import 'package:retrofit/dio.dart';

extension ParsedResponse<T> on HttpResponse<T> {
  bool get isSuccess => <int>[
        HttpStatus.ok,
        HttpStatus.created,
        HttpStatus.accepted,
        HttpStatus.notModified,
      ].contains(response.statusCode);
}
