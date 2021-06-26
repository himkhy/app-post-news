// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    id: json['id'] as int,
    tagTitleKh: json['tag_title_kh'] as String,
    tagTitleEn: json['tag_title_en'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'tag_title_kh': instance.tagTitleKh,
      'tag_title_en': instance.tagTitleEn,
    };
