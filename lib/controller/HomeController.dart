import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/dataSource/remote/home_data.dart';
import 'package:e_commerce_app/data/model/itemsModel.dart';
import 'package:e_commerce_app/data/model/offer_model/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';

abstract class HomeController extends GetxController {
  initial();
  // getData();
  goToitems(List Categories, int SelectedCate, String Cateid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String username = '';
  HomeData homedata = HomeData(Get.find());
  List data = [];
  List categories = [];
  List items = [];
  List users = [];
  String user = '';
  String email = '';
  List<OfferModel> offers = [];
  List newArrival = [];
  List settings = [];
  List<itemsModel> searchItemList = [];
  int selected = 0;
  statusrequest status = statusrequest.noun;
  TextEditingController myController = TextEditingController();
  String settingTitle = "";
  String settingBody = "";
  @override
  initial() async {}

  bool isSearch = false;

  checkSearch(val) {
    if (val == '') {
      isSearch = false;
      update();
    }
  }

  onSearch() {
    isSearch = true;
    update();
  }

  getData() async {
    status = statusrequest.loading;
    update();
    var response = await homedata.getData(myServices.sharedPreferences.getString("id")!);
    status = handlingData(response);
    if (statusrequest.success == status) {
      if (response['categories']['status'] == "success") {
        List dataresopnse = response['offers']["data"];
        categories.addAll(response['categories']['data']);
        if (response['topSelling']['status']=='success') {
          items.addAll(response['topSelling']['data']);
        }
         if (response['newArrival']['status']=='success') {
          newArrival.addAll(response['newArrival']['data']);
        }
        offers.addAll(dataresopnse.map((e) => OfferModel.fromJson(e)));
        users.addAll(response['users']['data']);
        settings.addAll(response['setting']['data']);
        settingTitle = settings[0]['setting_title'];
        settingBody = settings[0]['setting_body'];
        user = users[0]['user_name'];
        email=users[0]['user_email'];
        status = statusrequest.success;
      } else {
        status = statusrequest.failure;
      }
    }
    update();
  }

  @override
  goToitems(Categories, SelectedCate, Cateid) {
    Get.toNamed(Approuts.items, arguments: {
      "categories": Categories,
      "SelectedCate": SelectedCate,
      "catid": Cateid
    });
  }

  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(Approuts.login);
  }

  goToProduct(itemsmodel) {
    Get.toNamed(Approuts.product, arguments: {"itemModel": itemsmodel});
  }

  @override
  void onInit() {
    getData();
    initial();
    super.onInit();
  }
}
