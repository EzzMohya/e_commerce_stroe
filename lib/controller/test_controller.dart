import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/data/dataSource/remote/test_data.dart';
import 'package:get/get.dart';

class testController extends GetxController {
  TestData testdata = TestData(Get.find());
  List data = [];
  statusrequest status = statusrequest.noun;

  getDATA() async {
    statusrequest.loading;
    var response = await testdata.getData();
    status = handlingData(response);
    if (statusrequest.success == status) {
      data.addAll(response["data"]);
    }
    update();
  }

  @override
  void onInit() {
    getDATA();
    super.onInit();
  }
}
