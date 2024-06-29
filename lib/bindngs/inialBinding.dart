import 'package:e_commerce_app/core/class/curd.dart';
import 'package:get/get.dart';

class InialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Curd());
  }
}
