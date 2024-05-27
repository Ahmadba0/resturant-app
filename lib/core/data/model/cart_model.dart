class cartModel {
  int? itemsprice;
  int? itemscount;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDecs;
  String? itemsDecsAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsdiscount;
  String? itemsDate;
  int? itemsCat;

  cartModel(
      {this.itemsprice,
      this.itemscount,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDecs,
      this.itemsDecsAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsdiscount,
      this.itemsDate,
      this.itemsCat});

  cartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    itemscount = json['itemscount'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDecs = json['items_decs'];
    itemsDecsAr = json['items_decs_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsdiscount = json['itemsdiscount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['itemscount'] = this.itemscount;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_decs'] = this.itemsDecs;
    data['items_decs_ar'] = this.itemsDecsAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['itemsdiscount'] = this.itemsdiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}
