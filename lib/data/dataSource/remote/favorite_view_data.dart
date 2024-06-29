import 'package:e_commerce_app/core/class/curd.dart';
import 'package:e_commerce_app/core/constant/linkurl.dart';

class FavoriteViewData {
  Curd curd;
  FavoriteViewData(this.curd);

  viewData(String id) async {
    var response = await curd.postData(AppLink.view, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(int favoriteId) async {
    var response = await curd
        .postData(AppLink.removefavorite, {"id": favoriteId.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
