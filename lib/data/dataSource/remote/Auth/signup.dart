import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';

class SignupData {
  Curd curd;
  SignupData(this.curd);

  postData(String username, String email, String password, String phone) async {
    var response = await curd.postData(AppLink.signUp, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });

    return response.fold((l) => l, (r) => r);
  }
}
