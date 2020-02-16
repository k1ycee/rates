
import 'package:fire/aha/rates_call.dart';
import 'package:fire/aha/rates_model.dart';

class RatesRepository{
  RatesCall _ratesCall = RatesCall();
  Future<List<Rates>> getRates() => _ratesCall.fetchRates();
}