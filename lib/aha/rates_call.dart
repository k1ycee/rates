import 'package:fire/aha/rates_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RatesCall{

  String url = 'https://api.ratesapi.io/api/latest';
  Future<List<Rates>> fetchRates()async{
    final ask = await http.get(url);
    if (ask.statusCode == 200){
      return Rates.fromJson(jsonDecode(ask.body)).props;
    }
    return null;
  }
}