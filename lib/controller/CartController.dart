import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/dataSource/remote/cart_data.dart';
import 'package:e_commerce_app/data/model/cartModel.dart';
import 'package:e_commerce_app/data/model/couponModel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  MyServices myServices = Get.find();
  String priceorders = "0.0";

  String totalcountitems = "0";
  late TextEditingController controllerCoupon;
  statusrequest status = statusrequest.loading;
  Map isCart = {};
  CouponModel? couponModel;
  int? discountcoupon = 0;

  String? couponname;

  String? couponid;

  setFavorite(id, value) {
    isCart[id] = value;
    update();
  }

  resetVarCart() {
    totalcountitems = "0";
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  add(itemid, count) async {
    status = statusrequest.loading;
    update();
    var response = await cartData.addData(
        myServices.sharedPreferences.getString("id")!, count, itemid);
    status = handlingData(response);
    if (statusrequest.success == status) {
      print(status);
    } else {
      print(status);
    }
    update();
  }

  remove(itemid ,count) async {
    status = statusrequest.loading;
    update();
    var response = await cartData.removeData(
         myServices.sharedPreferences.getString("id")!, count, itemid);
    status = handlingData(response);
    if (statusrequest.success == status) {}
    update();
  }

  view() async {
    status = statusrequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    status = handlingData(response);
    if (statusrequest.success == status) {
      if (response['datacart']['status'] == 'success') {
        List dataresopnse = response["datacart"]["data"];
        Map dataresponsecountprice = response["countprice"];
        data.clear();
        data.addAll(dataresopnse.map((e) => CartModel.fromJson(e)));
        totalcountitems = dataresponsecountprice['totalcount'].toString();
        priceorders = dataresponsecountprice['totalprice'].toString();
        status = statusrequest.noun;
      } else {
        status = statusrequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    status = statusrequest.loading;
    update();
    var response = await cartData.checkCoupon(controllerCoupon.text);
    status = handlingData(response);
    if (statusrequest.success == status) {
      if (response['status'] == 'success') {
        Map<String, dynamic> couponResponse = response['data'];
        couponModel = CouponModel.fromJson(couponResponse);
        discountcoupon = int.parse(couponModel!.couponDiscount!.toString());
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId.toString();
      } else {
        discountcoupon = 0;
      }
    }
    update();
  }

  getPriceTotal() {
    return (double.parse(priceorders) -
        double.parse(priceorders) * discountcoupon! / 100);
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    view();
    checkCoupon();
    super.onInit();
  }
}
