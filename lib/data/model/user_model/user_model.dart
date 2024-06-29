class UserModel {
  int? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userPhone;
  int? userVerifycode;
  int? userApprove;
  String? userCreate;

  UserModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.userPhone,
    this.userVerifycode,
    this.userApprove,
    this.userCreate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json['user_id'] as int?,
        userName: json['user_name'] as String?,
        userEmail: json['user_email'] as String?,
        userPassword: json['user_password'] as String?,
        userPhone: json['user_phone'] as String?,
        userVerifycode: json['user_verifycode'] as int?,
        userApprove: json['user_approve'] as int?,
        userCreate: json['user_create'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'user_name': userName,
        'user_email': userEmail,
        'user_password': userPassword,
        'user_phone': userPhone,
        'user_verifycode': userVerifycode,
        'user_approve': userApprove,
        'user_create': userCreate,
      };
}
