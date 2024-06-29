import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/dataSource/remote/address_data.dart';
import 'package:e_commerce_app/data/dataSource/remote/orders/checkout_date.dart';
import 'package:e_commerce_app/data/model/addressModel.dart';
import 'package:e_commerce_app/data/model/cartModel.dart';
import 'package:e_commerce_app/data/model/couponModel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  List imageDelivery = [
    "assets/images/005-delivery-man.png",
    "assets/images/drivethru.png"
  ];
  List titles = ["Cash on Delivery", "Payment card"];
  List titleDelivery = ["Delivery", "Drive thru"];
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  CouponModel? couponModel;
  CartModel? cartModel;
  MyServices myServices = Get.find();
  int activeStep = 0;
  statusrequest status = statusrequest.loading;

  String? paymentMethod;
  String? deliveryType;
  String? addressId;
  String? addressIndex = "0";
  List<CartModel> data = [];
  late String couponid;
  late String coupondiscount;
  late String priceorders;
  bool change = true;
  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  getPriceTotal() {
    return (double.parse(priceorders) -
        double.parse(priceorders) * int.parse(coupondiscount) / 100);
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val, String id) {
    addressIndex = val;
    addressId = id;
    update();
  }

  activeStepper(int index) {
    activeStep = index;
    update();
  }

  changeButton(value) {
    change = value;
    update();
  }

  getShippingAddress() async {
    status = statusrequest.loading;

    var response = await addressData
        .viewData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    status = handlingData(response);

    if (statusrequest.success == status) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        status = statusrequest.failure;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }

    status = statusrequest.loading;

    update();

    Map data = {
      "userid": myServices.sharedPreferences.getString("id"),
      "addressid": addressId.toString(),
      "ordertype": deliveryType.toString(),
      "pricedelivery": "10",
      "orderprice": priceorders,
      "couponid": couponid,
      "discountcoupon": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString()
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    status = handlingData(response);

    if (statusrequest.success == status) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(Approuts.home);
        Get.snackbar("Success", "the order was successfully");
      } else {
        status = statusrequest.noun;
        Get.snackbar("Error", "try again");
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    data.addAll(Get.arguments['cartModel']);
    getShippingAddress();
    super.onInit();
  }
}
