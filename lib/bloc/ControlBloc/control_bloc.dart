import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../CounterBloc/counter_bloc.dart';

part 'control_event.dart';
part 'control_state.dart';

class ControlBloc extends Bloc<ControlEvent, ControlState> {
  final CounterBloc _counterBloc;
  late final StreamSubscription counterBlocSubscription;

  ControlBloc(this._counterBloc) : super(ControlInitial()) {
    on<ControlCheckWinEvent>((event, emit) {
      emit(ControlWin());
    });

    on<ControlCheckLoseEvent>((event, emit) {
      emit(ControlLose());
    });

    counterBlocSubscription = _counterBloc.stream.listen((state) {
      if (state >= 5) {
        add(ControlCheckWinEvent());
      }
      else {
        if (state <= -5) {
          add(ControlCheckLoseEvent());
        }
      }
    });
  }
    @override
    Future<void> close() async{
      counterBlocSubscription.cancel();
      return super.close();
    }
}

