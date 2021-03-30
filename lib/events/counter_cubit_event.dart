import 'package:flutter_app/state/counter_cubit_state.dart';

class CounterCubitIncreased extends CounterCubitState {
  const CounterCubitIncreased({String action, int count})
      : super(action: action, count: count);
}

class CounterCubitInitial extends CounterCubitState {
  const CounterCubitInitial({String action, int count})
      : super(action: action, count: count);
}

class CounterCubitDecreased extends CounterCubitState {
  const CounterCubitDecreased({String action, int count})
      : super(action: action, count: count);
}
