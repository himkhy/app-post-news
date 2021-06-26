/*
| ----------------------------------------------------------------------
| imageUrl
| ----------------------------------------------------------------------
| imageUrl is string type need context make full url
|
|
|
*/

import 'package:flutter/material.dart';
import 'package:postnews/config/app_config_wrapper.dart';

String url = "";

String imageUrlHelper(BuildContext context, String path) {
  if (url.isEmpty) {
    url = AppConfigWrapper.of(context).configuration['url'];
  }
  return "$url/$path";
}
