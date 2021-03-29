// 施工单数据请求
import 'dart:async' show Future;
import 'dart:async';
import 'package:dio/dio.dart';
import '../apis.dart';
import '../../utils/request.dart';
import '../../utils/preferences.dart';

class Construction {
  // 获取施工单列表
  static Future<Response> getConstructionList() async {
    var token = await Preferences.getStorage('accessToken');
    print(token);
    Options opts = Options(headers: {"authorization": token});
    var response =
        await NetworkUtilities.get(Api.GetConstructionList, options: opts);
    return response;
  }
}
