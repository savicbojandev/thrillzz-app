// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/error_model.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/error_type.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/logging_interceptor.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/network_response.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/response_status_code.dart';
import 'package:thrillzz_sports_app/infrastructure/infrastructure_const.dart';

class Api {
  factory Api.sportsApi() {
    final dio = Dio(
      BaseOptions(baseUrl: InfrastructureConst.apiBaseDomain),
    );

    if (kDebugMode) {
      dio.interceptors.add(LoggingInterceptor());
    }

    return Api._(dio);
  }

  Api._(this._dio);

  final Dio _dio;

  Future<NetworkResponse> get(
    String url, {
    Object? body,
    Map<String, dynamic>? queryParameters = const {},
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) async {
    final options = _createOptions(headers);

    final request = _dio.get<dynamic>(
      url,
      data: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    return _executeRequest(request);
  }

  Future<NetworkResponse> post(
    String url,
    Object? body, {
    Map<String, dynamic>? queryParameters = const {},
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) async {
    final options = _createOptions(headers);

    final request = _dio.post<dynamic>(
      url,
      queryParameters: queryParameters,
      data: body,
      options: options,
      cancelToken: cancelToken,
    );

    return _executeRequest(request);
  }

  Future<NetworkResponse> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) async {
    final options = _createOptions(headers);

    final request = _dio.delete<dynamic>(
      url,
      data: queryParameters,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );

    return _executeRequest(request);
  }

  Future<NetworkResponse> put(
    String url, {
    Object? body,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) async {
    final options = _createOptions(headers);

    final request = _dio.put<dynamic>(
      url,
      data: body,
      options: options,
      cancelToken: cancelToken,
    );

    return _executeRequest(request);
  }

  Options _createOptions(Map<String, String>? customHeaders) {
    final headers = {...InfrastructureConst.headers, ...?customHeaders};

    return Options(headers: headers);
  }

  Future<NetworkResponse> _processResponse(Response<dynamic> response) async {
    final resultData = response.data is Map<String, dynamic>
        ? response.data as Map<String, dynamic>
        : null;

    if (resultData != null) return NetworkResponse.success(resultData);

    final resultString = response.data is String
        ? response.data as String
        : null;

    if (resultString != null) {
      return NetworkResponse.message(resultString);
    }

    return NetworkResponse.error(
      AppError(
        message: 'Error while parsing response',
        type: ErrorType.failedParsing,
      ),
    );
  }

  Future<NetworkResponse> _executeRequest(
    Future<Response<dynamic>> request,
  ) async {
    try {
      final response = await request;

      return _processResponse(response);
    } on DioException catch (dioError) {
      return NetworkResponse.error(_handleDioError(dioError));
    } on Exception catch (exception) {
      return NetworkResponse.error(
        AppError(message: exception.toString()),
      );
    }
  }

  AppError _handleDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return AppError(
          message: 'Request cancelled',
          type: ErrorType.dioCancel,
        );
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
        return AppError(
          message: 'Connection timeout',
          type: ErrorType.connectionError,
        );
      case DioExceptionType.receiveTimeout:
        return AppError(
          message: 'Receive timeout',
          type: ErrorType.receiveTimeout,
        );
      case DioExceptionType.badResponse:
        return _handleResponseError(dioError);
      case DioExceptionType.sendTimeout:
        return AppError(
          message: 'Send timeout',
          type: ErrorType.sendTimeout,
        );
      case DioExceptionType.badCertificate:
        return AppError(
          message: 'Bad certificate',
        );
      case DioExceptionType.unknown:
        return AppError(
          message: 'Unknown error',
        );
    }
  }

  AppError _handleResponseError(DioException error) {
    final response = error.response;
    if (response == null) return AppError(message: 'Response is null');

    final statusError = ResponseStatusCode.fromCode(
      response.statusCode ?? -1,
    ).asAppError;
    final data = response.data;

    if (data is Map<String, dynamic>) {
      final errorModel = ErrorModel.fromJson(data);
      return AppError(
        message: errorModel.errorMessage,
        type: statusError.type,
      );
    }

    return AppError(
      message: data?.toString() ?? statusError.message,
      type: statusError.type,
    );
  }
}
