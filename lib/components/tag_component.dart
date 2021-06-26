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
    return Container(
      margin: EdgeInsets.only(top:2,left: 2,right: 2),
      decoration: BoxDecoration(
        color: Colors.white,
       // border: Border.all(width: 2.0),
        borderRadius: BorderRadius.all(
            Radius.circular(100.0) //                 <--- border radius here

        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top:10,left: 15, right: 15),
        child: Text('${ language == 'en' ? tag.tagTitleEn : tag.tagTitleKh}'),
      ),
    );
  }
}
