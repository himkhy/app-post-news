// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagResponse _$TagResponseFromJson(Map<String, dynamic> json) {
  return TagResponse(
    message: json['message'] as String,
    success: json['success'] as bool,
    code: json['code'] as int,
    data: (json['data'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TagResponseToJson(TagResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'code': instance.code,
      'data': instance.data,
    };
