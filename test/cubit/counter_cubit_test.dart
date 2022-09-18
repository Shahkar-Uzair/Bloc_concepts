// This folder is to test the Counter_cubit_cubit functionality

import 'package:flutter_bloc_concepts/cubit/counter_cubit_cubit.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('CounterCubitCubit', () {
    late CounterCubitCubit counterCubitCubit;

    setUp(() {
      counterCubitCubit = CounterCubitCubit();
    });

    tearDown(() {
      counterCubitCubit.close();
    });
    test('initial state for the Countercubit is CounterState(counterValue:0)',
        () {
      expect(counterCubitCubit.state,
          CounterCubitState(counterValue: 0, wasIncremented: false));
    });
  });
}
