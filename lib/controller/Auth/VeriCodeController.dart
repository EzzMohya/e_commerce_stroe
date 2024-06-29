import 'package:e_commerce_app/core/constant/routs.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword();
}

class VerifyCodeControllerIm extends VerifyCodeController {
  @override
  checkCode() {}

  @override
  goToResetPassword() {
    Get.offAllNamed(Approuts.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
