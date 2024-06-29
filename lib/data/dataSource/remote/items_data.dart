import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';

class ItemsData {
  Curd curd;
  ItemsData(this.curd);

  getData(String id, String userid) async {
    var response =
        await curd.postData(AppLink.item, {"id": id, "userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
