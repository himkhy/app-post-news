import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:postnews/config/app_config_wrapper.dart';
import 'package:postnews/models/news/news.dart';
import 'package:postnews/models/news/news_response.dart';
import 'package:postnews/models/news_detail/news_detail.dart';
import 'package:postnews/models/news_detail/news_detail_response.dart';

Future<List<News>> getNewsService(int perPage, int page) async {

 // String token =await AppSharePreference.instance.getString(SharePreferenceKey.kTOKEN);
  try {
    Response response = await AppConfigWrapper.dio.get('/api/cmspost/get-article?per_page=$perPage&page=$page',
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          //HttpHeaders.authorizationHeader: "Bearer $token",
        }));

    var objResponse = response.data as Map<String, dynamic>;

    var decodeData = NewsResponse.fromJson(objResponse);

    return decodeData.data;
  } catch (e) {
    throw Exception(e);
  }
}


Future<List<News>> getCategoryArticleNewsService(int cId,int perPage, int page) async {
  print('perPageID $cId');
  print('perPage $perPage');
  print('page $page');
  // String token =await AppSharePreference.instance.getString(SharePreferenceKey.kTOKEN);
  try {
    Response response = await AppConfigWrapper.dio.get('/api/cmspost/get-category-article/$cId?per_page=$perPage&page=$page',
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          //HttpHeaders.authorizationHeader: "Bearer $token",
        }));

    var objResponse = response.data as Map<String, dynamic>;

    var decodeData = NewsResponse.fromJson(objResponse);

    return decodeData.data;
  } catch (e) {
    throw Exception(e);
  }
}

Future<List<News>> getTagArticleNewsService(int tId,int perPage, int page) async {
  print('perPageID $tId');
  print('perPage $perPage');
  print('page $page');
  // String token =await AppSharePreference.instance.getString(SharePreferenceKey.kTOKEN);
  try {
    Response response = await AppConfigWrapper.dio.get('/api/cmspost/get-tag-detail/$tId?per_page=$perPage&page=$page',
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          //HttpHeaders.authorizationHeader: "Bearer $token",
        }));

    var objResponse = response.data as Map<String, dynamic>;

    var decodeData = NewsResponse.fromJson(objResponse);

    return decodeData.data;
  } catch (e) {
    throw Exception(e);
  }
}
