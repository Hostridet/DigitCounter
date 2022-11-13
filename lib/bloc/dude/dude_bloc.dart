import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dude_event.dart';
part 'dude_state.dart';

class DudeBloc extends Bloc<DudeEvent, DudeState> {
  DudeBloc() : super(DudeInitial()) {
    on<DudeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
