class AppLink {
  static const server = "https://ezzostore.online/eccommerce";
  static const test = "$server/test.php";

/*========================= auth =====================*/
  static const login = "$server/Auth/login.php";
  static const signUp = "$server/Auth/signup.php";
  /*======================= images ===================*/
  static const imagestatic = "$server/Uploade/categories";
  static const imagesitem = "$server/Uploade/items";
  static const imagesOffer = "$server/Uploade/offers";

  //==================================================
  //Home
  static const String home = "$server/home.php";
  static const String item = "$server/items/items.php";
  static const String searchItem = "$server/items/search.php";

  //Favorites
  static const String add = "$server/favorite/add.php";
  static const String remove = "$server/favorite/remove.php";
  static const String view = "$server/favorite/view.php";
  static const String removefavorite = "$server/favorite/removeFavorite.php";
  //Cart
  static const String addCart = "$server/cart/add.php";
  static const String removeCart = "$server/cart/remove.php";
  static const String viewCart = "$server/cart/view.php";
  static const String countitems = "$server/cart/getcountitems.php";
  //address
  static const String addAddress = "$server/address/add.php";
  static const String removeAddress = "$server/address/remove.php";
  static const String viewAddress = "$server/address/view.php";
  static const String editAddress = "$server/address/edit.php";

  //coupon
  static const String checkCoupon = "$server/coupon/checkcoupon.php";

  static const String pendingorders = "$server/orders/pending.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String ordersdetails = "$server/orders/detail.php";
  static const String ordersdelete = "$server/orders/delete.php";
  static const String orderscheckout = "$server/orders/checkout.php";

  static const String notification = "$server/notification.php";

  static const String offers = "$server/offers/offers.php";
  static const String viewUser = "$server/users/view.php";
}
