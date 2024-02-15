import 'package:bloc/bloc.dart';
import 'package:flutter_application_5/cubit/counter_states.dart';

// FORTH: BLOC FUNCTIONS
class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterStates());

  int count = 0;

  void incrementCounter() {
    count++;
    emit(CounterIncrementState());
  }

   void decrementCounter() {
    count--;
    emit(CounterDecrementState());
  }
}
