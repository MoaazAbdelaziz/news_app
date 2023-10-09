import 'package:collection/collection.dart';

import 'source.dart';

class SourceResponse {
  String? status;
  String? message;
  String? code;
  List<Source>? source;

  SourceResponse({
    this.status,
    this.message,
    this.code,
    this.source,
  });

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as String?,
      source: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'code': code,
        'sources': source?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SourceResponse) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ source.hashCode;
}
