import 'package:json_annotation/json_annotation.dart';
part 'news_detail.g.dart';

@JsonSerializable()
class NewsDetail {
  NewsDetail({
    this.id,
    this.titleKh,
    this.titleEn,
    this.images,
    this.articleKh,
    this.articleEn,
    this.createdAt,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title_kh')
  final String titleKh;
  @JsonKey(name: 'title_en')
  final String titleEn;
  @JsonKey(name: 'images')
  final String images;
  @JsonKey(name: 'article_kh')
  final String articleKh;
  @JsonKey(name: 'article_en')
  final String articleEn;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  factory NewsDetail.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailFromJson(json);

  Map<String, dynamic> toJson() => _$NewsDetailToJson(this);
}
