import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/dataSource/remote/address_data.dart';
import 'package:e_commerce_app/data/model/addressModel.dart';
import 'package:get/get.dart';

class ViewAddressController extends GetxController {
  statusrequest status = statusrequest.noun;
  AddressData viewData = AddressData(Get.find());
  MyServices myServices = Get.find();
  List<AddressModel> data = [];

  view() async {
    status = statusrequest.loading;
    update();
    var response =
        await viewData.viewData(myServices.sharedPreferences.getString("id")!);
    status = handlingData(response);
    if (statusrequest.success == status) {
      if (response['status'] == 'success') {
        List dataresopnse = response["data"];
        data.clear();
        data.addAll(dataresopnse.map((e) => AddressModel.fromJson(e)));
        status = statusrequest.success;
      } else {
        status = statusrequest.failure;
      }
    }
    update();
  }

  remove(addressid, index) async {
    status = statusrequest.loading;
    update();
    var response = await viewData.removeData(addressid);
    status = handlingData(response);
    if (statusrequest.success == status) {
      data.removeAt(index);
      if (data.isEmpty) {
        status = statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }

  goToAdd() {
    Get.toNamed(
      Approuts.addAddress,
    );
  }
}
