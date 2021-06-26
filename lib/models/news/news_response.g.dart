// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) {
  return NewsResponse(
    message: json['message'] as String,
    success: json['success'] as bool,
    code: json['code'] as int,
    data: (json['data'] as List)
        ?.map(
            (e) => e == null ? null : News.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'code': instance.code,
      'data': instance.data,
    };
