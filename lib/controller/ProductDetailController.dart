import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/dataSource/remote/cart_data.dart';
import 'package:e_commerce_app/data/model/cartModel.dart';
import 'package:e_commerce_app/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailController extends GetxController {
  initial();
}

class ProductDetailControllerImp extends ProductDetailController {
  late itemsModel itemsmodel;
  late statusrequest status;
  List Color = [Colors.red, Colors.black, Colors.blue];
  int count = 1;
  bool anim = true;
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  MyServices myServices = Get.find();
  List sizes = ["S", "M", "L", "XL", "XXL"];
  List colors = [Colors.grey, Colors.black, Colors.green, Colors.orange];
  countItems(itemid) async {
    status = statusrequest.loading;
    var response = await cartData.countItems(
        myServices.sharedPreferences.getString("id")!, itemid);
    status = handlingData(response);
    if (statusrequest.success == status) {
      if (response['status'] == "success") {
        int coutItems = 0;
        coutItems = response['data'];
        return coutItems;
      } else {
        status = statusrequest.failure;
      }
    }
  }

  replace() {
    if (anim == false) {
      anim = true;
      update();
      return anim;
    } else {
      anim = false;
      update();
      return anim;
    }
  }

  add() {
    count++;
    update();
  }

  minus() {
    if (count > 1) {
      count--;
      update();
    }
  }

  addItems(itemid, count) async {
    status = statusrequest.loading;
    update();
    var response = await cartData.addData(
        myServices.sharedPreferences.getString("id")!, count, itemid);
    status = handlingData(response);
    if (statusrequest.success == status) {
      Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text(
            "تم اضافة المنتج الى السلة ",
            style: TextStyle(color: Colors.white),
          ));
    } else {}
    update();
  }



  @override
  initial() async {
    status = statusrequest.loading;
    itemsmodel = Get.arguments["itemModel"];
    // count = await countItems(itemsmodel.itemId);
    status = statusrequest.success;
    update();
  }

  @override
  void onInit() {
    initial();
    super.onInit();
  }
}
