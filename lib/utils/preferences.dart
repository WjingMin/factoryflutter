// 存取本地缓存封装类
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async' show Future;
import 'dart:async';

class Preferences {
  // 写入缓存
  static setStorage(String key, String value) async {
    print(value);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // 获取缓存
  static Future<String> getStorage(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(key);
    return value;
  }

  // 清除缓存
  static clearStorage(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key); //删除指定键
    prefs.clear(); //清空键值对
  }
}
