import 'dart:convert';

import 'package:bizhan_study/bean/home_page_bean_entity.dart';
import 'package:dio/dio.dart';

class HttpUtils {
  //"http://116.62.149.237:8080/USR000100003"
  static void getHttp({url,onCallBack}) async {
    try {
      Response response = await Dio().get(url);
      onCallBack(response.toString());
    } catch (e) {
      print(e);
    }
  }
}
