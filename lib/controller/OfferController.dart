import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/data/dataSource/remote/offers_data.dart';
import 'package:e_commerce_app/data/model/offer_model/offer_model.dart';
import 'package:get/get.dart';

class OfferController extends GetxController {
  List categories = [];
  OffersData dataOffer = OffersData(Get.find());
  List<OfferModel> data = [];
  statusrequest status = statusrequest.loading;

  view() async {
    status = statusrequest.loading;
    update();
    var response = await dataOffer.getData();
    status = handlingData(response);
    if (statusrequest.success == status) {
      if (response['status'] == 'success') {
        List dataresopnse = response["data"];
        data.addAll(dataresopnse.map((e) => OfferModel.fromJson(e)));
      } else {
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
}
