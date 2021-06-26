import 'package:flutter/material.dart';
import 'package:postnews/models/category/category.dart';
import 'package:postnews/services/category_service.dart';

class CategoryViewModel extends ChangeNotifier {
  List<Category> _oldCategoryList =[];

  List<Category> get oldCategoryList => _oldCategoryList;
  set oldCategoryList(List<Category> value) {
    _oldCategoryList = value;
    notifyListeners();
  }

  Future getCategory() async {
    try {

      List<Category> response = await getCategoryService();

      var tmpCategoryList = List.of(response);
      oldCategoryList = List.of(tmpCategoryList);


    } catch (error) {

    }
  }
}
