import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLogin();
}

class SuccessSignUpControllerIm extends SuccessSignUpController {
  @override
  goToLogin() {
    Get.offNamed(Approuts.login);
  }
}
