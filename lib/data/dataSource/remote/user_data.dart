import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';

class UsersData {
  Curd curd;
  UsersData(this.curd);

  viewUser(String userid) async {
    var response = await curd.postData(AppLink.viewUser, {
      "id": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
