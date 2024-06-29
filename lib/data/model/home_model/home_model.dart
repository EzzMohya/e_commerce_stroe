import 'categories.dart';
import 'items.dart';
import 'offers.dart';
import 'setting.dart';

class HomeModel {
  Categories? categories;
  Items? items;
  Offers? offers;
  Setting? setting;

  HomeModel({this.categories, this.items, this.offers, this.setting});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        categories: json['categories'] == null
            ? null
            : Categories.fromJson(json['categories'] as Map<String, dynamic>),
        items: json['items'] == null
            ? null
            : Items.fromJson(json['items'] as Map<String, dynamic>),
        offers: json['offers'] == null
            ? null
            : Offers.fromJson(json['offers'] as Map<String, dynamic>),
        setting: json['setting'] == null
            ? null
            : Setting.fromJson(json['setting'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'categories': categories?.toJson(),
        'items': items?.toJson(),
        'offers': offers?.toJson(),
        'setting': setting?.toJson(),
      };
}
