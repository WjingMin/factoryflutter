class Api {
  // 开发环境
  static const String BASE_URL = 'http://39.108.75.121:5003';

  static const String DO_LOGIN = BASE_URL + '/cms/user/login'; //登陆
  // 获取施工单列表
  static const String GetConstructionList =
      BASE_URL + '/v1/produce/construct/search';
}
