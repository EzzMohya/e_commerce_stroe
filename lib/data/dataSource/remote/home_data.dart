import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';

class HomeData {
  Curd curd;
  HomeData(this.curd);

  getData(String id) async {
    var response = await curd.postData(AppLink.home, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  searchData(String searchWord) async {
    var response =
        await curd.postData(AppLink.searchItem, {"search": searchWord});
    return response.fold((l) => l, (r) => r);
  }
}
