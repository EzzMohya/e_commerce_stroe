import 'dart:convert';

import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/function/check%20Internet.dart';
import 'package:http/http.dart' as http;

class Curd {
  Future<Either<statusrequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await CheckInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(statusrequest.serverfail);
        }
      } else {
        return const Left(statusrequest.offline);
      }
    } catch (e) {
      return const Left(statusrequest.error);
    }
  }
}
