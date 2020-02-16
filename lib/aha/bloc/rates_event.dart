part of 'rates_bloc.dart';

abstract class RatesEvent extends Equatable {
  const RatesEvent();
  @override
  List<Object> get props => [];
}

class FetchRates extends RatesEvent{}
