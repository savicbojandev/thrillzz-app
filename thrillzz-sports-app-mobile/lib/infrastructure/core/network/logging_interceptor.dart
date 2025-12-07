import 'dart:developer';

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    log('COMPLETE URL: ${options.uri}');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
    // We ignore the lint here because the super function is just overriden.
    // ignore: avoid-dynamic
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log(
      'RESPONSE[${response.statusCode}] => '
      'PATH: ${response.requestOptions.path}',
    );

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    log('ERRORMSG: ${err.message}');

    return super.onError(err, handler);
  }
}
