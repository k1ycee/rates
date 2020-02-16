import 'package:equatable/equatable.dart';

class Rates extends Equatable{
    final String base;
    final Map<String, double> rates;
    final DateTime date;

    Rates({
        this.base,
        this.rates,
        this.date,
    });
    @override 
    List<Object> get props => [base,rates,date];
    
    factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        base: json["base"] == null ? null : json["base"],
        rates: json["rates"] == null ? null : Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "base": base == null ? null : base,
        "rates": rates == null ? null : Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "date": date == null ? null : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    };
}
