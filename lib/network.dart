import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';

class NetworkHelper {

  Future sendRequest(String coin, String money) async {

    String url = kBaseUrl + coin + kMiddleUrl + money + kToken;
    //String url = 'https://rest.coinapi.io/v1/exchangerate/ETH/EUR?apikey=979AB064-A1FE-4EED-B132-24A7861F5A15';

    http.Response response = await http.get(url);

    if(response.statusCode == 200) return jsonDecode(response.body);
    else {
      print(response.statusCode);
      return response.statusCode.toString();
    }
  }
}