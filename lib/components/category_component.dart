import 'package:flutter/material.dart';
import 'package:postnews/constants/app_fonts.dart';
import 'package:postnews/helpers/share_preference.dart';
import 'package:postnews/helpers/share_preference_key.dart';
import 'package:postnews/models/category/category.dart';

class CategoryComponent extends StatelessWidget {
  final Category category;
  const CategoryComponent({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = AppSharePreference.getString(SharePreferenceKey.kLanguage);
    return Container(

      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Text('${language == 'en' ? category.ctitleEn : category.ctitleKh}',style: AppFonts.largeText(),));


  }
}
