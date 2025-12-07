import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thrillzz_sports_app/infrastructure/core/network/error/app_error.dart';

part 'network_response.freezed.dart';

@freezed
class NetworkResponse with _$NetworkResponse {
  const factory NetworkResponse.success(Map<String, dynamic> data) = Ok;

  const factory NetworkResponse.message(String message) = OkWithMessage;

  const factory NetworkResponse.error(AppError e) = ERROR;
}
