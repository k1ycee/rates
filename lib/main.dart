import 'package:fire/aha/bloc/rates_bloc.dart';
import 'package:fire/aha/rates_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

RatesRepository rates = RatesRepository();

void main() {
  runApp(Fire( ratesRepo:  rates,));
}



class Fire extends StatelessWidget {
  final ratesRepo;
  Fire({this.ratesRepo});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar:AppBar(title: Text('Exchange Rates'),centerTitle: true,),
        body: BlocProvider(
          create: (context) => RatesBloc(repository: rates)..add(FetchRates()),
          child: Exchange(), 
        ),
      ),
    );
  }
}

class Exchange extends StatefulWidget {
  @override
  _ExchangeState createState() => _ExchangeState();
}
class _ExchangeState extends State<Exchange> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatesBloc,RatesState>(
      builder: (context,state){
        if(state is Begin){
          return Center(child: SpinKitPulse(color: Colors.blue,size: 80,),);
        }
        if(state is RatesError){
          return Center(child: Text('Did not fetch rates try again'),);
        }
        if(state is RatesLoaded){
          return Center(child: Text(state.rates.toString()));
        }
        return null;
      }
    );
  }
}
// class Rates extends StatefulWidget {
//   @override
//   _RatesState createState() => _RatesState();
// }

// class _RatesState extends State<Rates> {
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }


// class ExchangeRates extends StatelessWidget {
//   final rates;
//   ExchangeRates({this.rates});
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(rates),
//     );
//   }
// }