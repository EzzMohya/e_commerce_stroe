import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/dataSource/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  FavoriteData favoritedata = FavoriteData(Get.find());
  List data = [];
  MyServices myServices = Get.find();

  statusrequest status = statusrequest.noun;
  Map isFavorite = {};

  setFavorite(id, value) {
    isFavorite[id] = value;
    update();
  }

  addFavorite(itemid) async {
    statusrequest.loading;

    var response = await favoritedata.addData(
        myServices.sharedPreferences.getString("id")!, itemid);
    status = handlingData(response);
    if (statusrequest.success == status) {}
  }

  removeFavorite(itemid) async {
    statusrequest.loading;
    var response = await favoritedata.removeData(
        myServices.sharedPreferences.getString("id")!, itemid);
    status = handlingData(response);
    if (statusrequest.success == status) {}
  }
}
