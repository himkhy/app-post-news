import 'dart:io';
import 'package:dio/dio.dart';
import 'package:postnews/config/app_config_wrapper.dart';
import 'package:postnews/models/category/category.dart';
import 'package:postnews/models/category/category_response.dart';

Future<List<Category>> getCategoryService() async {
  //String token = await AppSharePreference.instance.getString(SharePreferenceKey.kTOKEN);
  try {
    Response response = await AppConfigWrapper.dio.get('/api/cmspost/get-category',
        options: Options(headers: {
          HttpHeaders.acceptHeader: "application/json",
          //HttpHeaders.authorizationHeader: "Bearer $token",
        }));

    var objResponse = response.data as Map<String, dynamic>;
    var decodeData = CategoryResponse.fromJson(objResponse);

    return decodeData.data;
  } catch (e) {
    throw Exception(e);
  }
}
