class OrderModel {
  int? orderId;
  int? orderUserid;
  int? orderAddress;
  int? orderType;
  int? orderPricedelivery;
  String? orderPrice;
  String? orderTotalprice;
  int? orderCoupon;
  int? orderRating;
  String? orderNote;
  int? orderPaymentmethod;
  int? orderStatus;
  String? orderCreate;
  int? addressId;
  int? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  OrderModel(
      {this.orderId,
      this.orderUserid,
      this.orderAddress,
      this.orderType,
      this.orderPricedelivery,
      this.orderPrice,
      this.orderTotalprice,
      this.orderCoupon,
      this.orderRating,
      this.orderNote,
      this.orderPaymentmethod,
      this.orderStatus,
      this.orderCreate,
      this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderAddress = json['order_address'];
    orderType = json['order_type'];
    orderPricedelivery = json['order_pricedelivery'];
    orderPrice = json['order_price'];
    orderTotalprice = json['order_totalprice'];
    orderCoupon = json['order_coupon'];
    orderRating = json['order_rating'];
    orderNote = json['order_note'];
    orderPaymentmethod = json['order_paymentmethod'];
    orderStatus = json['order_status'];
    orderCreate = json['order_create'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_userid'] = this.orderUserid;
    data['order_address'] = this.orderAddress;
    data['order_type'] = this.orderType;
    data['order_pricedelivery'] = this.orderPricedelivery;
    data['order_price'] = this.orderPrice;
    data['order_totalprice'] = this.orderTotalprice;
    data['order_coupon'] = this.orderCoupon;
    data['order_rating'] = this.orderRating;
    data['order_note'] = this.orderNote;
    data['order_paymentmethod'] = this.orderPaymentmethod;
    data['order_status'] = this.orderStatus;
    data['order_create'] = this.orderCreate;
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
