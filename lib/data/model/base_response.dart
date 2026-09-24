import 'package:equatable/equatable.dart';

/// Common wrapper for every API response.
/// Change the keys here if your backend uses a different format.
class BaseResponse extends Equatable {
  final dynamic data;
  final String? message;
  final Meta? meta;
  final bool? success;

  const BaseResponse({this.data, this.message, this.meta, this.success});

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        data: json['data'],
        message: json['message']?.toString(),
        meta: json['meta'] is Map<String, dynamic> ? Meta.fromJson(json['meta']) : null,
        success: json['success'] is bool ? json['success'] : null,
      );

  /// Safe parse for any response body (map, list, string or null).
  factory BaseResponse.fromData(dynamic body) {
    if (body is Map<String, dynamic>) return BaseResponse.fromJson(body);
    return BaseResponse(data: body);
  }

  Map<String, dynamic> toJson() => {
        'data': data,
        'message': message,
        'meta': meta?.toJson(),
        'success': success,
      };

  /// True when the server did not report a failure and sent data.
  bool get isSuccess => success ?? data != null;

  /// Message to show to the user.
  String get displayMessage => meta?.message ?? message ?? '';

  BaseResponse copyWith({dynamic data, String? message, Meta? meta, bool? success}) => BaseResponse(
        data: data ?? this.data,
        message: message ?? this.message,
        meta: meta ?? this.meta,
        success: success ?? this.success,
      );

  @override
  List<Object?> get props => [data, message, meta, success];
}

class Meta extends Equatable {
  final String? message;
  final String? url;
  final Map<String, dynamic> raw;

  const Meta({this.message, this.url, this.raw = const {}});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        message: json['message']?.toString(),
        url: json['url']?.toString(),
        raw: json,
      );

  Map<String, dynamic> toJson() => raw;

  @override
  List<Object?> get props => [message, url, raw];
}
