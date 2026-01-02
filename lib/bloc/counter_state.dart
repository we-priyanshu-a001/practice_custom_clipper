part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int counter;
  final bool inc;
  const CounterState(this.counter, this.inc);
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(0, false);
}

final class CounterUpdated extends CounterState {
  const CounterUpdated(int value, bool tell) : super(value, tell);
}
