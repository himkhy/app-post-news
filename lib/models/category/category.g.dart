// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as int,
    ctitleKh: json['ctitle_kh'] as String,
    ctitleEn: json['ctitle_en'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'ctitle_kh': instance.ctitleKh,
      'ctitle_en': instance.ctitleEn,
    };
