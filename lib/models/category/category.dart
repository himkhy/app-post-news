import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

//flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class Category {
  Category({
    this.id,
    this.ctitleKh,
    this.ctitleEn,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'ctitle_kh')
  final String ctitleKh;
  @JsonKey(name: 'ctitle_en')
  final String ctitleEn;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
