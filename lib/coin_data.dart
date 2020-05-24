import 'package:http/http.dart' as http;
import 'dart:convert';

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
  'NGN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];


class CoinData {
  Future getCoinData(selectedCurrency) async {
    String apikey = 'C7B8DC5D-4027-4646-9AD9-61DA90FF6E21';
    http.Response response = await http
        .get('https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=$apikey');
    if (response.statusCode == 200) {
      print("body${response.body}");
      return jsonDecode(response.body);
    } else {
      print("error${response.statusCode}");
    }
  }

  Future getCoinData2(selectedCurrency) async {
    String apikey = 'C7B8DC5D-4027-4646-9AD9-61DA90FF6E21';
    http.Response response = await http
        .get('https://rest.coinapi.io/v1/exchangerate/ETH/$selectedCurrency?apikey=$apikey');
    if (response.statusCode == 200) {
      print("body${response.body}");
      return jsonDecode(response.body);
    } else {
      print("error${response.statusCode}");
    }
  }

  Future getCoinData3(selectedCurrency) async {
    String apikey = 'C7B8DC5D-4027-4646-9AD9-61DA90FF6E21';
    http.Response response = await http
        .get('https://rest.coinapi.io/v1/exchangerate/LTC/$selectedCurrency?apikey=$apikey');
    if (response.statusCode == 200) {
      print("body${response.body}");
      return jsonDecode(response.body);
    } else {
      print("error${response.statusCode}");
    }
  }
}
