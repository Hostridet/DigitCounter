import 'package:dz_bloc/page/CounterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dz_bloc/bloc/CounterBloc/counter_bloc.dart';
import 'package:dz_bloc/bloc/ControlBloc/control_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var counterBloc = CounterBloc();
    var controlBLoc = ControlBloc(counterBloc);

    return MaterialApp(
      title: 'Counter example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => counterBloc,
          ),
          BlocProvider(
            create: (context) => controlBLoc,
          ),
        ],
        child: CounterPage(counterBloc: counterBloc, controlBLoc: controlBLoc)
      ),
    );
  }
}