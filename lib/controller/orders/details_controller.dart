import 'package:e_commerce_app/data/dataSource/remote/orders/details_data.dart';
import 'package:e_commerce_app/data/model/OrderDetailModel.dart';
import 'package:e_commerce_app/data/model/orderModel.dart';
import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  late OrderModel orderModel;
  late OrderDetailModel orderDetailModel;
  MyServices myServices = Get.find();
  OrdersDetailsData orderDetailData = OrdersDetailsData(Get.find());
  List<OrderModel> orders = [];
  List<OrderDetailModel> ordersDetail = [];
  statusrequest status = statusrequest.loading;

  getOrderData() async {
    ordersDetail.clear();
    status = statusrequest.loading;
    update();
    var response = await orderDetailData.getData(orderModel.orderId.toString());
    status = handlingData(response);
    if (statusrequest.success == status) {
      if (response['status'] == "success") {
        List orderData = response["data"];
        ordersDetail.addAll(orderData.map((e) => OrderDetailModel.fromJson(e)));
      } else {
        status = statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    orderModel = Get.arguments['listOrder'];
    getOrderData();
    super.onInit();
  }
}
