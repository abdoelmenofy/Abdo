import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelber {
  String url = '';
  NetworkHelber(this.url);

  Future<dynamic> getData() async {
    var url2 = Uri.parse(url);

    Response response = await get(url2);
    var decodedData;
    if (response.statusCode == 200) {
      String data = response.body;
      decodedData = jsonDecode(data); // the return type of this method is dynamic
      print(decodedData);
    } else {
      print('response.statusCode : ${response.statusCode}');
    }
    return decodedData;
  }
}
