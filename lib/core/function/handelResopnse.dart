import 'package:e_commerce_app/core/class/statusrequest.dart';

handlingData(response) {
  if (response is statusrequest) {
    return response;
  } else {
    return statusrequest.success;
  }
}
