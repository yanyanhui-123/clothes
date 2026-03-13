/// 用户登录
class UserLoginReq {
  String? phone;

  UserLoginReq({
    this.phone,
  });

  factory UserLoginReq.fromJson(Map<String, dynamic> json) {
    return UserLoginReq(
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'phone': phone,
      };
}
