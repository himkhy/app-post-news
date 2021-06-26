// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetail _$NewsDetailFromJson(Map<String, dynamic> json) {
  return NewsDetail(
    id: json['id'] as int,
    titleKh: json['title_kh'] as String,
    titleEn: json['title_en'] as String,
    images: json['images'] as String,
    articleKh: json['article_kh'] as String,
    articleEn: json['article_en'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
  );
}

Map<String, dynamic> _$NewsDetailToJson(NewsDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_kh': instance.titleKh,
      'title_en': instance.titleEn,
      'images': instance.images,
      'article_kh': instance.articleKh,
      'article_en': instance.articleEn,
      'created_at': instance.createdAt?.toIso8601String(),
    };
