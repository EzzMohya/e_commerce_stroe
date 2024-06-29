import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';

class TestData {
  Curd curd;
  TestData(this.curd);

  getData() async {
    var response = await curd.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
