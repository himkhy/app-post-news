import 'package:json_annotation/json_annotation.dart';
import 'package:postnews/models/news_detail/news_detail.dart';
part 'news_detail_response.g.dart';

@JsonSerializable()
class NewsDetailResponse {
  NewsDetailResponse({
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
  final NewsDetail data;

  factory NewsDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsDetailResponseToJson(this);
}
