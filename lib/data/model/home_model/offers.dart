import 'datum.dart';

class Offers {
  String? status;
  List<Datum>? data;

  Offers({this.status, this.data});

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
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
