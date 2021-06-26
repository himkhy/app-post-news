import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:postnews/config/app_config_wrapper.dart';

import 'package:postnews/models/news_detail/news_detail.dart';
import 'package:postnews/models/news_detail/news_detail_response.dart';

Future<NewsDetail> getNewsDetailService(int id) async {
  //String token = await AppSharePreference.instance.getString(SharePreferenceKey.kTOKEN);
  try {
    Response response = await AppConfigWrapper.dio.get("/api/cmspost/get-detail/$id",
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
         // HttpHeaders.authorizationHeader: "Bearer $token",
        }));

    var objResponse = response.data as Map<String, dynamic>;

    var decodeData = NewsDetailResponse.fromJson(objResponse);
    return decodeData.data;
  } catch (e) {

    throw Exception(e);
  }
}