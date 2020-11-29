import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response getAPI = await http.get(url);

    if (getAPI.statusCode == 200) {
      String data = getAPI.body;
      return jsonDecode(data);

    } else {
      print(getAPI.statusCode);
    }
  }
}
