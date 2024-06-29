class OfferModel {
  int? offerId;
  String? offerTitle;
  String? offerSub;
  String? offerImage;

  OfferModel({
    this.offerId,
    this.offerTitle,
    this.offerSub,
    this.offerImage,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        offerId: json['offer_id'] as int?,
        offerTitle: json['offer_title'] as String?,
        offerSub: json['offer_sub'] as String?,
        offerImage: json['offer_image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'offer_id': offerId,
        'offer_title': offerTitle,
        'offer_sub': offerSub,
        'offer_image': offerImage,
      };
}
