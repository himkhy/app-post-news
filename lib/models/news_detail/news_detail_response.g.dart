// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailResponse _$NewsDetailResponseFromJson(Map<String, dynamic> json) {
  return NewsDetailResponse(
    message: json['message'] as String,
    success: json['success'] as bool,
    code: json['code'] as int,
    data: json['data'] == null
        ? null
        : NewsDetail.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NewsDetailResponseToJson(NewsDetailResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'code': instance.code,
      'data': instance.data,
    };
