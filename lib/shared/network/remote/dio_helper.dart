import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;
//
  // https://student.valuxapps.com/api/
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://equran.id/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response>? getData({
    @required url,
    Map<String, dynamic>? query,
    String? lang = 'en',
    String? authorization,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': authorization ?? '',
      'Content-Type': 'application/json'
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response>? postData({
    @required String? url,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String? lang = 'en',
    String? authorization,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': authorization ?? '',
      'Content-Type': 'application/json'
    };
    return await dio!.post(url!, data: data);
  }
  static Future<Response>? putData({
    @required String? url,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String? lang = 'en',
    String? authorization,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': authorization ?? '',
      'Content-Type': 'application/json'
    };
    return await dio!.put(url!, data: data);
  }
}