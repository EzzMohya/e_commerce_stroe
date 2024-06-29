import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:e_commerce_app/core/function/handelResopnse.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/dataSource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController {
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;
  Position? position;
  String lat = "";
  String long = "";
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  statusrequest status = statusrequest.noun;

  initialData() async {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    await getPosition();
    print(lat);
  }

  add() async {
    status = statusrequest.loading;
    update();
    var response = await addressData.addData(
        myServices.sharedPreferences.getString("id")!,
        name.text,
        city.text,
        street.text,
        lat,
        long);
    status = handlingData(response);
    print(status);
    if (statusrequest.success == status) {
      status = statusrequest.success;
      Get.toNamed(Approuts.home);
    } else {
      status = statusrequest.failure;
    }
    update();
  }

  getPosition() async {
    bool services = false;
    LocationPermission pre;
    services = await Geolocator.isLocationServiceEnabled();

    if (services == false) {}
    pre = await Geolocator.checkPermission();
    if (pre == LocationPermission.denied) {
      pre = await Geolocator.requestPermission();
    } else {
      position = await Geolocator.getCurrentPosition().then((value) => value);
      lat = position!.latitude.toString();
      long = position!.longitude.toString();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    city.dispose();
    street.dispose();
    super.dispose();
  }
}
