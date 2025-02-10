// lib/cubit/counter_cubit.dart
import 'package:bloc/bloc.dart';

/// A Cubit that manages an integer counter.
class CounterCubit extends Cubit<int> {
  // The initial state is 0.
  CounterCubit() : super(0);

  /// Increment the counter by 1.
  void increment() => emit(state + 1);

  /// Decrement the counter by 1.
  void decrement() => emit(state - 1);
}
