import 'datum.dart';

class Setting {
  String? status;
  List<Datum>? data;

  Setting({this.status, this.data});

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
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
