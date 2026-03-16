import 'package:yyh_clothes/common/index.dart';
import 'package:yyh_clothes/common/database/index.dart';
import 'package:isar/isar.dart';

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

  Future<User?> getUserInfo() async {
    final isar = await IsarService().db;
    return await isar.users.where().findFirst();
  }

  Future<bool> changeUserName(User user, String value) async {
    final isar = await IsarService().db;
    await isar.writeTxn(() async {
      user.name = value;
      await isar.users.put(user);
    });
    return true;
  }

  Future<bool> changeUserDesc(User user, String value) async {
    final isar = await IsarService().db;
    await isar.writeTxn(() async {
      user.desc = value;
      await isar.users.put(user);
    });
    return true;
  }
  
}
