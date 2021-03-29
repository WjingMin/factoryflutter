import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

Map<String, dynamic> optHeader = {
  'accept-language': 'zh-cn',
  'content-type': 'application/json'
};

Dio dio = new Dio(BaseOptions(connectTimeout: 6000, headers: optHeader));

class NetworkUtilities {
  /// 工具初始化
  NetworkUtilities() {
    // 网络拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("网络请求（请求前）=====");
    }, onResponse: (Response response) {
      print("网络请求（响应前）=====");
      return response; // continue
    }, onError: (DioError e) {
      print("网络请求（异常...）=====");
      Fluttertoast.showToast(
          msg: '网络请求异常 msg:$e.message', toastLength: Toast.LENGTH_LONG);
      return e; //continue
    }));
  }

  /// GET 请求
  static Future<Response> get(String url,
      {Map<String, dynamic> params, Options options}) async {
    var response;
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    var dir = new Directory("$documentsPath/cookies");
    await dir.create();
    // print('documentPath:${dir.path}');
    // dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));
    if (params != null) {
      response = await dio.get(url, queryParameters: params, options: options);
    } else {
      response = await dio.get(url, options: options);
    }
    return response;
  }

  /// POST 请求
  static Future<Response> post(String url,
      {Map<String, dynamic> params, dynamic data, Options options}) async {
    var response = await dio.post(url,
        queryParameters: params, data: data, options: options);
    return response;
  }

  // POST 数据
  static Future<Response> upload(String url,
      [dynamic data, Options options]) async {
    var response = await dio.post(url, data: data, options: options);
    return response;
  }

  /// PUT 请求
  static Future<Response> put(String url,
      {Map<String, dynamic> params, dynamic data, Options options}) async {
    var response = await dio.put(url,
        queryParameters: params, data: data, options: options);
    return response;
  }

  /// DELETE 请求
  static Future<Response> delete(String url,
      {Map<String, dynamic> params, dynamic data, Options options}) async {
    var response = await dio.delete(url,
        queryParameters: params, data: data, options: options);
    return response;
  }
}
