import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';

TranslateDatabase(NameAr, NameEn) {
  MyServices myservice = Get.find();
  if (myservice.sharedPreferences.getString("lang") == "ar") {
    return NameAr;
  } else {
    return NameEn;
  }
}
