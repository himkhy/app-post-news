import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';

@JsonSerializable()
class News {
  News({
    this.id,
    this.userId,
    this.categoriesId,
    this.tagId,
    this.titleKh,
    this.titleEn,
    this.descriptionKh,
    this.descriptionEn,
    this.images,
    this.articleKh,
    this.articleEn,
    this.createdAt,
    this.updatedAt,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'categories_id')
  final int categoriesId;
  @JsonKey(name: 'tag_id')
  final int tagId;
  @JsonKey(name: 'title_kh')
  final String titleKh;
  @JsonKey(name: 'title_en')
  final String titleEn;
  @JsonKey(name: 'description_kh')
  final String descriptionKh;
  @JsonKey(name: 'description_en')
  final String descriptionEn;
  @JsonKey(name: 'images')
  final String images;
  @JsonKey(name: 'article_kh')
  final String articleKh;
  @JsonKey(name: 'article_en')
  final String articleEn;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
