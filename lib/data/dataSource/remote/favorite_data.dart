import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';

class FavoriteData {
  Curd curd;
  FavoriteData(this.curd);

  addData(String userid, int itemid) async {
    var response = await curd
        .postData(AppLink.add, {"userid": userid, "itemid": itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeData(String userid, int itemid) async {
    var response = await curd.postData(
        AppLink.remove, {"userid": userid, "itemid": itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
