class UserProfileModel {
  int? userID;
  String? userName;
  String? phone;
  List? batteries;

  UserProfileModel({
    this.userID,
    this.userName,
    this.phone,
    this.batteries,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      userID: json['userID'] as int?,
      userName: json['userName'] as String?,
      phone: json['phone'] as String?,
      batteries: json['batteries'] as List?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'userName': userName,
        'phone': phone,
        'batteries': batteries,
      };
}
