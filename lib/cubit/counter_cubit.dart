import 'package:flutter_app/events/counter_cubit_event.dart';
import 'package:flutter_app/state/counter_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterCubitInitial(action: 'Intialized', count: 0));

  void increment() =>
      emit(CounterCubitIncreased(action: 'Increased', count: state.count + 1));
  void decrement() =>
      emit(CounterCubitDecreased(action: 'Decreased', count: state.count - 1));
}
