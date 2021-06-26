import 'package:json_annotation/json_annotation.dart';
import 'package:postnews/models/news/news.dart';
part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  NewsResponse({
    this.message,
    this.success,
    this.code,
    this.data,
  });

  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'success')
  final bool success;
  @JsonKey(name: 'code')
  final int code;
  @JsonKey(name: 'data')
  final List<News> data;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}
