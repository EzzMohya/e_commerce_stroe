import 'datum.dart';

class Items {
  String? status;
  List<Datum>? data;

  Items({this.status, this.data});

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        status: json['status'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
