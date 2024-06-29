import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';

class AddressData {
  Curd curd;
  AddressData(this.curd);
  viewData(String userid) async {
    var response = await curd.postData(AppLink.viewAddress, {
      "userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(String userid, String name, String city, String street, String lat,
      String long) async {
    var response = await curd.postData(AppLink.addAddress, {
      "userid": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(String userid, String name, String city, String street, String lat,
      String long) async {
    var response = await curd.postData(AppLink.editAddress, {
      "userid": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeData(String addressid) async {
    var response = await curd.postData(AppLink.removeAddress, {
      "addressid": addressid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
