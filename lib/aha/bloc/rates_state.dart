part of 'rates_bloc.dart';

abstract class RatesState extends Equatable {
  const RatesState();
  @override
  List<Object> get props => [];
}

class Begin extends RatesState {}
class RatesError extends RatesState{}
class RatesLoaded extends RatesState{
  final List<Rates> rates;
  const RatesLoaded({
    this.rates
  });
  @override 
  List<Object> get props => [rates];
}