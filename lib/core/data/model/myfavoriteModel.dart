class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemsid;
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
  int? usersId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
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
      this.itemsCat,
      this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];
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
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_itemsid'] = this.favoriteItemsid;
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
    data['users_id'] = this.usersId;
    return data;
  }
}
