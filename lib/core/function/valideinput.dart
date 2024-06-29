import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return "Not valid username";
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "Not valid email";
    }
  }
  if (type == 'password') {
    if (!GetUtils.isPassport(val)) {
      return "Not valid password";
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not valid phone";
    }
  }
  if (val.length < min) {
    return "value cant be less than $min";
  }
  if (val.length > max) {
    return "value cant be larger than $max";
  }
}
