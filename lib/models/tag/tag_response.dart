import 'package:json_annotation/json_annotation.dart';
import 'package:postnews/models/tag/tag.dart';
part 'tag_response.g.dart';

@JsonSerializable()
class TagResponse {
  TagResponse({
    this.message,
    this.success,
    this.code,
    this.data,
  });

  final String message;
  final bool success;
  final int code;
  final List<Tag> data;

  factory TagResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TagResponseToJson(this);
}
