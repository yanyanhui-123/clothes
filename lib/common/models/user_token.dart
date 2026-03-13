/// 用户令牌
class UserTokenModel {
  String? token;
  String? uid;

  UserTokenModel({
    this.token,
    this.uid,
  });

  factory UserTokenModel.fromJson(Map<String, dynamic> json) {
    return UserTokenModel(
      token: json['token'] as String?,
      uid: json['uid'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'uid': uid,
  };
}