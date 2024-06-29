
import 'package:e_commerce_app/controller/Auth/LoginController.dart';
import 'package:e_commerce_app/core/class/handelingDataReq.dart';
import 'package:e_commerce_app/core/function/AlertExit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: AlertExitApp,
        child: GetBuilder<LoginControllerIm>(
          builder: (controller) => HandlingDataRequest(
              statusRequest: controller.status,
              widget: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: LoginForm(
                  controller: controller,
                ),
              )),
        ));
  }
}
