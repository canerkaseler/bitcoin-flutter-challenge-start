import 'package:flutter/cupertino.dart';

import 'network.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'YOUR-API-KEY-HERE';

class CoinData {
  //TODO: Create your getCoinData() method here.

  Future<dynamic> getCoinData(String coin, String money) async {
    var coinData = await NetworkHelper().sendRequest(coin, money);

    double value = coinData['rate'];

    return Data(
      coinData['asset_id_quote'],
      coinData['asset_id_base'],
      value.toStringAsFixed(2),
    );
  }
}

class Data {
  String money;
  String coin;
  String value;

  Data(this.money, this.coin, this.value);
}
