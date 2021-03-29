import 'dart:convert';

import 'package:dio/dio.dart';
import '../apis/apis.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/preferences.dart';

Map<String, dynamic> optHeader = {
  'accept-language': 'zh-cn',
  'content-type': 'application/json'
};

class HttpManager {
  final String _BASEURL = Api.BASE_URL;
  final int _CONNECTTIMEOUT = 5000;
  final int _RECEIVETIMEOUT = 3000;

  //单例模式
  static HttpManager _instance;
  Dio _dio;
  BaseOptions _options;

  //单例模式，只创建一次实例
  static HttpManager getInstance() {
    if (null == _instance) {
      _instance = new HttpManager();
      return _instance;
    }
  }

  //构造函数
  HttpManager() {
    _options = new BaseOptions(
        baseUrl: _BASEURL,
        //连接时间为5秒
        connectTimeout: _CONNECTTIMEOUT,
        //响应时间为3秒
        receiveTimeout: _RECEIVETIMEOUT,
        //设置请求头
        headers: optHeader,
        //默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
        contentType: Headers.jsonContentType,
        //共有三种方式json,bytes(响应字节),stream（响应流）,plain
        responseType: ResponseType.json);
    _dio = new Dio(_options);
    //设置Cookie
    // _dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      print("在请求之前的拦截信息");
      // 每次请求之前都去将token塞入请求头中
      try {
        // 获取缓存的token
        var access_token = await Preferences.getStorage('access_token');
        // 判断是否存在token
        if (access_token != null) {
          // token存在则在请求头中加入token验证
          options.headers['authorization'] = 'Bearer ' + access_token;
        }
      } catch (e) {
        print("获取缓存token失败");
      }
      return options;
    }, onResponse: (Response response) {
      print("在响应之前的拦截信息");
      return response;
    }, onError: (DioError e) {
      print("在错误之前的拦截信息");
      return e;
    }));
  }

  //get请求方法
  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      if (data != null) {
        response = await _dio.get(url,
            queryParameters: data, options: options, cancelToken: cancelToken);
      } else {
        response = await _dio.get(url, options: options);
      }
    } on DioError catch (e) {
      formatError(e);
    }
    return response;
  }

// put请求
  put(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.put(url, data: data);
    } on DioError catch (e) {
      formatError(e);
    }
    return response;
  }

  // del 请求
  delete(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.delete(url, data: data);
    } on DioError catch (e) {
      formatError(e);
    }
    return response;
  }

  //post请求
  // post(url,
  //     {params,
  //     options,
  //     cancelToken,
  //     Map<String, String> queryParameters}) async {
  //   Response response;
  //   try {
  //     response = await _dio.post(url,
  //         queryParameters: params, options: options, cancelToken: cancelToken);
  //     print('postHttp response: $response');
  //   } on DioError catch (e) {
  //     print(e.response);
  //     // print('postHttp exception: $e');
  //     formatError(e);
  //   }
  //   return response;
  // }

  //post Form请求
  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.post(url,
          options: options, cancelToken: cancelToken, data: data);
      // print('postHttp response: $response');
    } on DioError catch (e) {
      // print('postHttp exception: $e');
      print(e.response);
      formatError(e);
    }
    return response;
  }

  //下载文件
  downLoadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await _dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        print('$count $total');
      });
      print('downLoadFile response: $response');
    } on DioError catch (e) {
      print('downLoadFile exception: $e');
      formatError(e);
    }
    return response;
  }

  //取消请求
  cancleRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  void formatError(DioError e) {
    var data = jsonDecode(e.response.toString());
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      Fluttertoast.showToast(
        msg: '连接超时',
        gravity: ToastGravity.CENTER,
      );
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      Fluttertoast.showToast(
        msg: '请求超时',
        gravity: ToastGravity.CENTER,
      );
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      Fluttertoast.showToast(
        msg: '响应超时',
        gravity: ToastGravity.CENTER,
      );
    } else if (e.type == DioErrorType.RESPONSE) {
      Fluttertoast.showToast(
        msg: '错误码:' +
            data['code'].toString() +
            ',' +
            '提示:' +
            data['message'].toString(),
        gravity: ToastGravity.CENTER,
      );
    } else if (e.type == DioErrorType.CANCEL) {
      Fluttertoast.showToast(
        msg: '请求取消',
        gravity: ToastGravity.CENTER,
      );
    } else {
      Fluttertoast.showToast(
        msg: '未知错误',
        gravity: ToastGravity.CENTER,
      );
    }
  }
}
