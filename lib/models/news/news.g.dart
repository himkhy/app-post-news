// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    id: json['id'] as int,
    userId: json['user_id'] as int,
    categoriesId: json['categories_id'] as int,
    tagId: json['tag_id'] as int,
    titleKh: json['title_kh'] as String,
    titleEn: json['title_en'] as String,
    descriptionKh: json['description_kh'] as String,
    descriptionEn: json['description_en'] as String,
    images: json['images'] as String,
    articleKh: json['article_kh'] as String,
    articleEn: json['article_en'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'categories_id': instance.categoriesId,
      'tag_id': instance.tagId,
      'title_kh': instance.titleKh,
      'title_en': instance.titleEn,
      'description_kh': instance.descriptionKh,
      'description_en': instance.descriptionEn,
      'images': instance.images,
      'article_kh': instance.articleKh,
      'article_en': instance.articleEn,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
