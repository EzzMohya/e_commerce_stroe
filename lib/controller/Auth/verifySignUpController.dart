import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:get/get.dart';

abstract class VerifySignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerifySignUpControllerIm extends VerifySignUpController {
  @override
  checkCode() {}

  @override
  goToSuccessSignUp() {
    Get.offAllNamed(Approuts.successSignUp);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
