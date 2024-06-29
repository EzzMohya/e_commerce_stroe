import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/dataSource/remote/items_data.dart';
import 'package:e_commerce_app/data/model/itemsModel.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeIndex(int SelectedCate);
  ChangeCate(int SelectedCate, String cateid);
  getItems();
  goToProduct(itemsModel itemsmodel);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selected;
  String? cate;
  MyServices myServices = Get.find();
  String username = '';
  ItemsData dataItem = ItemsData(Get.find());
  List data = [];

  List items = [];
  statusrequest status = statusrequest.loading;
  @override
  initialData() {
    categories = Get.arguments['categories'];
    selected = Get.arguments['SelectedCate'];
    cate = Get.arguments['catid'];
    getItems();
  }

  @override
  getItems() async {
    items.clear();
    status = statusrequest.loading;
    var response = await dataItem.getData(
        cate!, myServices.sharedPreferences.getString("id")!);
    status = handlingData(response);
    if (statusrequest.success == status) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
      } else {
        status = statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  changeIndex(SelectedCate) {
    selected = SelectedCate;
    update();
  }

  @override
  ChangeCate(SelectedCate, cateid) {
    selected = SelectedCate;
    cate = cateid;
    getItems();
    update();
  }

  @override
  goToProduct(itemsmodel) {
    Get.toNamed(Approuts.product, arguments: {"itemModel": itemsmodel});
  }
}
