import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/dataSource/remote/favorite_view_data.dart';
import 'package:e_commerce_app/data/model/myfavoriteModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyFavoriteViewController extends GetxController {
  FavoriteViewData favoritedata = FavoriteViewData(Get.find());
  List<MyFavoriteModel> data = [];
  MyServices myServices = Get.find();

  statusrequest status = statusrequest.noun;
  Map isFavorite = {};
  TextEditingController myController = TextEditingController();

  viewFavorite() async {
    status = statusrequest.loading;
    var response = await favoritedata
        .viewData(myServices.sharedPreferences.getString("id")!);
    status = handlingData(response);
    if (statusrequest.success == status) {
      if (response['status'] == "success") {
        List responsive = response['data'];
        data.addAll(responsive.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        status = statusrequest.failure;
      }
    }
    update();
  }

  removeFavorite(int favoriteId) {
    favoritedata.removeFavorite(favoriteId);
    data.removeWhere((element) => element.favoriteId == favoriteId);

    update();
  }

  @override
  void onInit() {
    viewFavorite();
    super.onInit();
  }
}
