class Api {
  // 开发环境
  static const String BASE_URL = 'http://39.108.75.121:5003';

  static const String DO_LOGIN = '/cms/user/login'; //登陆
  static const String USER_MSG = '/cms/user/permissions'; // 用户信息

  // 获取施工单列表
  static const String GetConstructionList = '/v1/produce/construct/search';
}
