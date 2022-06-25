import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/price_screen.dart';
import 'dart:math';
import 'dart:convert';


const apikey='705B6B0A-A444-4297-BD0A-3F29EDF35F52';
const coinio='https://rest.coinapi.io/v1/exchangerate';


class NetworkArea {

  // NetworkArea({this.currencyCoin,this.selectecCurrency});
  String curriencyRate;
  String selectecCurrency;
  String currencyCoin;


  Future<void> getData() async{
    

    http.Response response = await http.get(Uri.parse('$coinio/$currencyCoin/$selectecCurrency?apikey=$apikey'));

    if(response.statusCode==200){
      String data = response.body;

      var decodedjson = jsonDecode(data)['rate'];
      //setState(() {
        
      curriencyRate=decodedjson.toStringAsFixed(2);
     // });
      print(response.body);
    print(curriencyRate);
      return curriencyRate;
     

  } else{
      print(response.statusCode);
    }
  }
  
}