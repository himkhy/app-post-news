import 'package:json_annotation/json_annotation.dart';
import 'package:postnews/models/category/category.dart';
part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  CategoryResponse({
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
  final List<Category> data;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
