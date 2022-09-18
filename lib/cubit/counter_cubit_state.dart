part of 'counter_cubit_cubit.dart';

class CounterCubitState extends Equatable {
  int counterValue;
  bool wasIncremented;

  CounterCubitState({
    required this.counterValue,
    required this.wasIncremented,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue, wasIncremented];
}
