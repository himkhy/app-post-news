import 'package:flutter/material.dart';
import 'package:postnews/views/main_view.dart';
import 'package:postnews/views/news_detail_view.dart';
import 'package:postnews/views/news_view.dart';
import 'package:postnews/views/splash_view.dart';
import 'package:postnews/views/tag_view.dart';

class PartRoute {
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api". Enjoy building your API!
|
*/

  /*
  |-----------------------------------------
  |   All routes
  |------------------------------------------
  |   @return  Map<String, WidgetBuilder>
  |
  */
  static Map<String, WidgetBuilder> allRoutes() {
    return {
      '/': (BuildContext context) => SplashView(),
      '/main_view': (BuildContext context) => MainView(),
      '/tag_view': (BuildContext context) =>TagView(),
      '/news_detail_view': (BuildContext context) => NewsDetailView(),
      '/news_view': (BuildContext context) => NewsView(),

    };
  }
}
