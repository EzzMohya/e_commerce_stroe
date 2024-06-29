import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final statusrequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == statusrequest.loading
        ? Center(
            child: Lottie.asset(
            APPimage.cart,
            width: 200,
            height: 200,
          ))
        : statusRequest == statusrequest.offline
            ? Center(
                child: Lottie.asset(
                APPimage.offline,
                width: 100,
                height: 100,
              ))
            : statusRequest == statusrequest.offline
                ? Center(
                    child: Lottie.asset(APPimage.server,
                        width: 100, height: 100, repeat: false))
                : statusRequest == statusrequest.failure
                    ? Center(
                        child: Lottie.asset(APPimage.nodata,
                            width: 250, height: 250, repeat: false))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final statusrequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == statusrequest.loading
        ? Center(child: Lottie.asset(APPimage.loading, width: 250, height: 250))
        : statusRequest == statusrequest.offline
            ? Center(
                child: Lottie.asset(APPimage.offline, width: 250, height: 250))
            : statusRequest == statusrequest.serverfail
                ? Center(
                    child:
                        Lottie.asset(APPimage.server, width: 250, height: 250))
                : widget;
  }
}
