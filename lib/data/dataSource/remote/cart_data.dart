import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';

class CartData {
  Curd curd;
  CartData(this.curd);

  addData(String userid,int count ,int itemid) async {
    var response = await curd.postData(
        AppLink.addCart, {"userid": userid,"count":count.toString() ,"itemid": itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  removeData(String userid,int count ,int itemid) async {
    var response = await curd.postData(
        AppLink.removeCart, {"userid": userid,"count":count.toString() ,"itemid": itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  countItems(String userid, int itemid) async {
    var response = await curd.postData(
        AppLink.countitems, {"userid": userid, "itemid": itemid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String userid) async {
    var response = await curd.postData(AppLink.viewCart, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response =
        await curd.postData(AppLink.checkCoupon, {"couponName": couponName});
    return response.fold((l) => l, (r) => r);
  }
}
