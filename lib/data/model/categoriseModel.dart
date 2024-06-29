class CategoriesModel {
  int? cateId;
  String? cateName;
  String? cateNameAr;
  String? cateImage;
  String? cateDatetime;

  CategoriesModel(
      {this.cateId,
      this.cateName,
      this.cateNameAr,
      this.cateImage,
      this.cateDatetime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    cateId = json['cate_id'];
    cateName = json['cate_name'];
    cateNameAr = json['cate_name_ar'];
    cateImage = json['cate_image'];
    cateDatetime = json['cate_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cate_id'] = this.cateId;
    data['cate_name'] = this.cateName;
    data['cate_name_ar'] = this.cateNameAr;
    data['cate_image'] = this.cateImage;
    data['cate_datetime'] = this.cateDatetime;
    return data;
  }
}
