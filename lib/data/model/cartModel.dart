class CartModel {
  int? itemprice;
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartItemid;
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

  CartModel(
      {this.itemprice,
      this.countitems,
      this.cartId,
      this.cartUsersid,
      this.cartItemid,
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
      this.itemNameAr});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemprice = json['itemprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemid = json['cart_itemid'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemprice'] = this.itemprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemid'] = this.cartItemid;
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
    return data;
  }
}
