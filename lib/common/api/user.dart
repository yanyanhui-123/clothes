import 'package:yyh_clothes/common/index.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await WPHttpService.to.post(
      '/users/register',
      data: req,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<UserTokenModel> login(UserLoginReq? req) async {
    var res = await WPHttpService.to.post(
      '/api/v1/sys/auth/af/login',
      data: req,
    );
    
    return UserTokenModel.fromJson(res.data['data']);
  }

  /// Profile
  static Future<Map> profile() async {
    var res = await WPHttpService.to.get(
      '/api/v1/sys/aftersale/user/${UserService.to.uid}',
    );
    print("yyh-resProfile ${res.data['data']}");
    return res.data['data'];
  }
}
