import 'package:flutter/material.dart';
import 'package:postnews/helpers/listener_state_helper.dart';
import 'package:postnews/models/news/news.dart';
import 'package:postnews/services/news_service.dart';

class NewsViewModel extends ChangeNotifier {
  List<News> _oldNewsList =[];

  ListenerStateHelper _listenerStateHelper;
  bool hasMoreDataPush = false;


  ListenerStateHelper get listenerStateHelper => _listenerStateHelper;
  set listenerStateHelper(ListenerStateHelper value) {
    _listenerStateHelper = value;
    notifyListeners();
  }
  List<News> get oldNewsList => _oldNewsList;
  set oldNewsList(List<News> value) {


    _oldNewsList += value;
    hasMoreDataPush = value.length >= 15;
    notifyListeners();
  }
  Future getNews(int perPage, int page) async{

    try{
      listenerStateHelper = ListenerStateHelper.Loading;
      if(page == 1){
        oldNewsList.clear();
      }
      await Future.delayed(Duration(seconds: 2));

      List<News> response = await getNewsService(perPage,page);

      var tmpNewsList = List.of(response);
      oldNewsList = List.of(tmpNewsList);


      listenerStateHelper = ListenerStateHelper.Loaded;
    }catch(error){
      listenerStateHelper = ListenerStateHelper.Error;
    }

  }

  Future getCategoryArticle(int cId,int perPage, int page) async{

    try{
      listenerStateHelper = ListenerStateHelper.Loading;
      if(page == 1){
        oldNewsList.clear();
      }
      await Future.delayed(Duration(seconds: 2));

      List<News> response = await getCategoryArticleNewsService(cId,perPage,page);

      var tmpNewsList = List.of(response);
      oldNewsList = List.of(tmpNewsList);


      listenerStateHelper = ListenerStateHelper.Loaded;
    }catch(error){

      listenerStateHelper = ListenerStateHelper.Error;
    }


  }

  Future getTagArticle(int tId,int perPage, int page) async{

    try{
      listenerStateHelper = ListenerStateHelper.Loading;
      if(page == 1){
        oldNewsList.clear();
      }
      await Future.delayed(Duration(seconds: 2));

      List<News> response = await getTagArticleNewsService(tId,perPage,page);

      var tmpNewsList = List.of(response);
      oldNewsList = List.of(tmpNewsList);


      listenerStateHelper = ListenerStateHelper.Loaded;
    }catch(error){

      listenerStateHelper = ListenerStateHelper.Error;
    }


  }

}
