import 'dart:async' show Future;
import 'dart:async';
import 'package:dio/dio.dart';
import '../apis.dart';
import '../../utils/request.dart';

class Login {
  static Future<Response> login(String username, String passsword) async {
    var form = {'username': username, 'password': passsword};
    var response = await NetworkUtilities.post(Api.DO_LOGIN, data: form);
    return response;
  }
}
