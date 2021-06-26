/*
| ---------------------------------------------------------------------- 
| main.dadrt is first run app
| ----------------------------------------------------------------------     
|   MultiProvider state management 
|   PartRoute is running page 
|
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:postnews/helpers/share_preference.dart';
// import 'package:postnews/helpers/share_preference.dart';
import 'package:postnews/routes/route.dart';
import 'package:postnews/view_models/category_viewmodel.dart';
import 'package:postnews/view_models/news_detail_viewmodel.dart';
import 'package:postnews/view_models/news_viewmodel.dart';
import 'package:postnews/view_models/tag_viewmodel.dart';
import 'package:provider/provider.dart';
import 'config/app_config_wrapper.dart';
import 'constants/app_colors.dart';
import 'package:connectivity/connectivity.dart';
import 'env.dart';
import 'helpers/share_preference_key.dart';

var navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await AppSharePreference.setString(SharePreferenceKey.kLanguage, 'kh');
  var language = AppSharePreference.getString(SharePreferenceKey.kLanguage); //get from share preference
  runApp(MultiProvider(
    child: AppConfigWrapper(
      child: MyApp(navigatorKey: navigatorKey),
      /*
      |----------------------------------------------
      | configuration is running file env connection api url
      |----------------------------------------------
      | @env is name contant in env.dart
      |php artisan serve --host=192.168.43.176
      |*/

      configuration: env,
      language: language, // get from share preference
    ),
    providers: [
      // StreamProvider.value(
      //   value: Connectivity().onConnectivityChanged,
      //   initialData: null,
      // ),
      ChangeNotifierProvider.value(value: NewsViewModel()),
      ChangeNotifierProvider.value(value: TagViewModel()),
      ChangeNotifierProvider.value(value: CategoryViewModel()),
      ChangeNotifierProvider.value(value: NewsDetailViewModel()),
    ],
  ));
}

class MyApp extends StatelessWidget {
  /*
  |-------------------------------------------
  | MyApp screen running
  |-------------------------------------------
  |This widget is the root of your application.
  |
  |*/

  final navigatorKey;

  const MyApp({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: AppColors.primaryBlue,
       // primaryColor: AppColors.themeColor(),
      ),
      debugShowCheckedModeBanner: false,
      /*
      |------------------------------------------
      | home route the first running app
      |------------------------------------------
      | @initialRoute is root of route
      | @routes is a route connection to file route
      | @navigatorKey is navigation globle screen connection provider
      |
      */
      //home: Container(),
      initialRoute: '/',
      routes: PartRoute.allRoutes(),
      navigatorKey: navigatorKey,
    );
  }
}
