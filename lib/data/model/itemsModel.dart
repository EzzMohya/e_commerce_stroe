class itemsModel {
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDisc;
  String? itemDiscAr;
  String? itemImage;
  int? itemCount;
  int? itemActive;
  String? itemPrice;
  int? itemDiscount;
  String? itemDate;
  int? itemCate;
  int? cateId;
  String? cateName;
  String? cateNameAr;
  String? cateImage;
  String? cateDatetime;
  int? favorite;
  String? ItemPriceDiscount;

  itemsModel(
      {this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDisc,
      this.itemDiscAr,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDate,
      this.itemCate,
      this.cateId,
      this.cateName,
      this.cateNameAr,
      this.cateImage,
      this.cateDatetime,
      this.favorite,
      this.ItemPriceDiscount});

  itemsModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDisc = json['item_disc'];
    itemDiscAr = json['item_disc_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    ItemPriceDiscount = json['price_discount'].toString();
    itemDiscount = json['item_discount'];
    itemDate = json['item_date'];
    itemCate = json['item_cate'];
    cateId = json['cate_id'];
    cateName = json['cate_name'];
    cateNameAr = json['cate_name_ar'];
    cateImage = json['cate_image'];
    cateDatetime = json['cate_datetime'];
    favorite = json['favroite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_name_ar'] = this.itemNameAr;
    data['item_disc'] = this.itemDisc;
    data['item_disc_ar'] = this.itemDiscAr;
    data['item_image'] = this.itemImage;
    data['item_count'] = this.itemCount;
    data['item_active'] = this.itemActive;
    data['item_price'] = this.itemPrice;
    data['item_discount'] = this.itemDiscount;
    data['item_date'] = this.itemDate;
    data['item_cate'] = this.itemCate;
    data['cate_id'] = this.cateId;
    data['cate_name'] = this.cateName;
    data['cate_name_ar'] = this.cateNameAr;
    data['cate_image'] = this.cateImage;
    data['cate_datetime'] = this.cateDatetime;
    data['favroite'] = this.favorite;
    return data;
  }
}
