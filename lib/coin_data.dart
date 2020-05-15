//TODO: Add your imports here.
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
const apiKey = 'AD0FA69C-C8EB-4491-9B0A-DE62BD5E6C3B';
//rest.coinapi.io/v1/exchangerate/BTC/USD
class CoinData {
  //TODO: Create your getCoinData() method here.
  Future<Map<String,int>> getCoinData(String currency) async{
    Map<String,int> pricesMap = {};
    for(String element in cryptoList) {
      http.Response response = await http.get('$coinAPIURL/$element/$currency?apikey=AD0FA69C-C8EB-4491-9B0A-DE62BD5E6C3B');
      if(response.statusCode == 200){
        var decodedData = jsonDecode(response.body);
        int price =decodedData['rate'].toInt();
        pricesMap[element] = price;
      }else{
        print(response.statusCode);
        pricesMap[element] = 0;
      }
    }
    return pricesMap;
    // http.Response response = await http.get('$coinAPIURL/BTC/$currency?apikey=AD0FA69C-C8EB-4491-9B0A-DE62BD5E6C3B');
    // if (response.statusCode ==200){
    //   var decodedData = jsonDecode(response.body);
    //   int price =decodedData['rate'].toInt();
    //   return price;

    // }else{
    //   print(response.statusCode);
    // }
  }

}
