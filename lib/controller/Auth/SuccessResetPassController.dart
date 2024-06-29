import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:get/get.dart';

abstract class SuccessResetController extends GetxController {
  goToLogin();
}

class SuccessResetControllerIm extends SuccessResetController {
  @override
  goToLogin() {
    Get.offNamed(Approuts.login);
  }
}
