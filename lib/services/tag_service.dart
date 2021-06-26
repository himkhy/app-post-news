import 'dart:io';
import 'package:dio/dio.dart';
import 'package:postnews/config/app_config_wrapper.dart';
import 'package:postnews/models/tag/tag.dart';
import 'package:postnews/models/tag/tag_response.dart';

//reading Vehicle
Future<List<Tag>> getTagService() async {
  //String token = await AppSharePreference.instance.getString(SharePreferenceKey.kTOKEN);
  try {
    Response response = await AppConfigWrapper.dio.get('/api/cmspost/get-tag',
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
         // HttpHeaders.authorizationHeader: "Bearer $token",
        }));
    var objResponse = response.data as Map<String, dynamic>;
    var decodeData = TagResponse.fromJson(objResponse);
    return decodeData.data;
  } catch (e) {
    throw Exception(e);
  }
}
