import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';

class CheckoutData {
  Curd crud;
  CheckoutData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(AppLink.orderscheckout, data);
    return response.fold((l) => l, (r) => r);
  }
}
