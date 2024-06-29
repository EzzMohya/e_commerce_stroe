import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';

class OffersData {
  Curd curd;
  OffersData(this.curd);

  getData() async {
    var response = await curd.postData(AppLink.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
