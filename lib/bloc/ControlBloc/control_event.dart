part of 'control_bloc.dart';

@immutable
abstract class ControlEvent {}

class ControlCheckWinEvent extends ControlEvent {}

class ControlCheckLoseEvent extends ControlEvent {}


