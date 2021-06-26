import 'package:json_annotation/json_annotation.dart';
part 'tag.g.dart';

//flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class Tag {
    Tag({
        this.id,
        this.tagTitleKh,
        this.tagTitleEn,
    });

    @JsonKey(name: 'id')
    final int id;
    @JsonKey(name: 'tag_title_kh')
    final String tagTitleKh;
    @JsonKey(name: 'tag_title_en')
    final String tagTitleEn;

  factory Tag.fromJson(Map<String, dynamic> json) =>  _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
