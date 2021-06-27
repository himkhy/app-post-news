import 'package:flutter/material.dart';
import 'package:postnews/helpers/share_preference.dart';
import 'package:postnews/helpers/share_preference_key.dart';
import 'package:postnews/models/tag/tag.dart';

class TagComponent extends StatelessWidget {
  final Tag tag;
  const TagComponent({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = AppSharePreference.getString(SharePreferenceKey.kLanguage);
    return Text('${ language == 'en' ? tag.tagTitleEn : tag.tagTitleKh}');
  }
}
