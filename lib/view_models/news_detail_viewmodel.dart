import 'package:flutter/material.dart';
import 'package:postnews/helpers/listener_state_helper.dart';
import 'package:postnews/models/news_detail/news_detail.dart';
import 'package:postnews/services/news_detail_service.dart';

class NewsDetailViewModel extends ChangeNotifier {
  NewsDetail _oldNewsDetail;
  ListenerStateHelper _listenerStateHelper;

  ListenerStateHelper get listenerStateHelper => _listenerStateHelper;
  set listenerStateHelper(ListenerStateHelper value) {
    _listenerStateHelper = value;
    notifyListeners();
  }

 NewsDetail get oldNewsDetail => _oldNewsDetail;
  set oldNewsDetail(NewsDetail value) {
    _oldNewsDetail = value;
    notifyListeners();
  }

 Future getNewsDetail(int id) async{

   try {
     listenerStateHelper = ListenerStateHelper.Loading;
     await Future.delayed(Duration(seconds: 2));
     NewsDetail response = await getNewsDetailService(id);

     oldNewsDetail = response;
     listenerStateHelper = ListenerStateHelper.Loaded;
   } catch(error) {

     listenerStateHelper = ListenerStateHelper.Error;
   }

 }

}
