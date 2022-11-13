part of 'control_bloc.dart';

@immutable
abstract class ControlState {}

class ControlInitial extends ControlState {}

class ControlWin extends ControlState {}

class ControlLose extends ControlState {}
