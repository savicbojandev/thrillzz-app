import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  ErrorModel({required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  @JsonKey(name: 'error_message')
  final String errorMessage;

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  ErrorModel copyWith({
    String? errorMessage,
  }) => ErrorModel(
    errorMessage: errorMessage ?? this.errorMessage,
  );
}
