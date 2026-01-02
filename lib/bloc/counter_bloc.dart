import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<CounterIncrement>((event, emit) {
      emit(CounterUpdated(state.counter + 1,true));
    });

    on<CounterDecrement>((event, emit) {
      if (state.counter == 0) {
        return;
      }
      emit(CounterUpdated(state.counter - 1,false));
    });
  }
}
