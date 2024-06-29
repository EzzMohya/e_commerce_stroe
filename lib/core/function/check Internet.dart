import 'dart:io';

CheckInternet() async {
  try {
    var result = await InternetAddress.lookup("goolge.com");
    if (result.isNotEmpty && result[0].address.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
