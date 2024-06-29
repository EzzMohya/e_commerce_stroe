class Datum {
  int? cateId;
  String? cateName;
  String? cateNameAr;
  String? cateImage;
  String? cateDatetime;

  Datum({
    this.cateId,
    this.cateName,
    this.cateNameAr,
    this.cateImage,
    this.cateDatetime,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cateId: json['cate_id'] as int?,
        cateName: json['cate_name'] as String?,
        cateNameAr: json['cate_name_ar'] as String?,
        cateImage: json['cate_image'] as String?,
        cateDatetime: json['cate_datetime'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'cate_id': cateId,
        'cate_name': cateName,
        'cate_name_ar': cateNameAr,
        'cate_image': cateImage,
        'cate_datetime': cateDatetime,
      };
}
