import '../apis.dart';
import '../../utils/request.dart';

class Login {
  static login(String username, String passsword) async {
    print('username' + username.toString());
    var response = HttpManager().post(Api.DO_LOGIN,
        data: {'username': username, 'password': passsword});
    return response;
  }

  static userInfo() async {
    var response = HttpManager().get(Api.USER_MSG);
    return response;
  }
}
