import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fire/aha/rates_model.dart';
import 'package:fire/aha/rates_repository.dart';

part 'rates_event.dart';
part 'rates_state.dart';

class RatesBloc extends Bloc<RatesEvent, RatesState> {

  final RatesRepository repository;

  RatesBloc({this.repository}) : assert(repository!=null);

  @override
  RatesState get initialState => Begin();

  @override
  Stream<RatesState> mapEventToState(
    RatesEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is FetchRates){
      yield Begin();
      try{
        final Rates rates = await repository.getRates();
        yield RatesLoaded(rates: rates);
      }
      catch(_){
        RatesError();
      }
    }
  }
}
