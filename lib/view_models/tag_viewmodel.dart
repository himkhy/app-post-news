import 'package:flutter/material.dart';
import 'package:postnews/models/tag/tag.dart';
import 'package:postnews/services/tag_service.dart';

class TagViewModel extends ChangeNotifier {
  List<Tag> _oldTagList =[];

  List<Tag> get oldTagList => _oldTagList;
  set oldTagList(List<Tag> value) {
    _oldTagList = value;
    notifyListeners();
  }
  Future getTag() async{
    try{

      List<Tag> response = await getTagService();
      var tmpTagList = List.of(response);
      oldTagList = List.of(tmpTagList);

    }catch(error){

    }

  }

}
