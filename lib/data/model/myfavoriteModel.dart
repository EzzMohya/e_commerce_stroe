class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemid;
  int? itemId;
  String? itemName;
  String? itemDisc;
  String? itemDiscAr;
  String? itemImage;
  int? itemCount;
  int? itemActive;
  String? itemPrice;
  int? itemDiscount;
  String? itemDate;
  int? itemCate;
  String? itemNameAr;
  int? userId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemid,
      this.itemId,
      this.itemName,
      this.itemDisc,
      this.itemDiscAr,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDate,
      this.itemCate,
      this.itemNameAr,
      this.userId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemid = json['favorite_itemid'];
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemDisc = json['item_disc'];
    itemDiscAr = json['item_disc_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemDate = json['item_date'];
    itemCate = json['item_cate'];
    itemNameAr = json['item_name_ar'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_itemid'] = this.favoriteItemid;
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_disc'] = this.itemDisc;
    data['item_disc_ar'] = this.itemDiscAr;
    data['item_image'] = this.itemImage;
    data['item_count'] = this.itemCount;
    data['item_active'] = this.itemActive;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_date'] = this.itemDate;
    data['item_cate'] = this.itemCate;
    data['item_name_ar'] = this.itemNameAr;
    data['user_id'] = this.userId;
    return data;
  }
}
