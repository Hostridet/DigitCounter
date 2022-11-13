import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:dz_bloc/bloc/CounterBloc/counter_bloc.dart';
import 'package:dz_bloc/bloc/ControlBloc/control_bloc.dart';


class CounterPage extends StatelessWidget {
  CounterBloc counterBloc;
  ControlBloc controlBLoc;
  CounterPage({Key? key, required this.counterBloc, required this.controlBLoc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              BlocBuilder<CounterBloc, int>(
                builder: (context, count) {
                  return Text(
                    'Количество: $count',
                  );
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IncrementButton(context),
                  DecrementButton(context),
                ],
              ),
              ClearButton(context),
            ],
          ),
        ),
    );
  }

  Widget ClearButton(BuildContext context)
  {
    return Container(
      width: 210,
      child: ElevatedButton(
        onPressed: () {
          counterBloc.add(CounterNull());
        },
        child: const Text("Clear", style: TextStyle(fontSize: 20)),
      ),
    );
  }
  Widget IncrementButton(BuildContext context)
  {
    return BlocListener<ControlBloc, ControlState>(
      bloc: controlBLoc,
      listener: (context, state) {
        if (state is ControlWin) {
          buildInfoLayout(context, "Вы выиграли!");
        }
        if (state is ControlLose) {
          buildInfoLayout(context, "Вы проиграли");
        }
      },
      child: ElevatedButton(
        onPressed: () {
          counterBloc.add(CounterIncrement());
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }

  Widget DecrementButton(BuildContext context)
  {
    return BlocListener<ControlBloc, ControlState>(
      bloc: controlBLoc,
      listener: (context, state) {
        if (state is ControlWin) {
          buildInfoLayout(context, "Вы выиграли!");
        }
        if (state is ControlLose) {
          buildInfoLayout(context, "Вы проиграли");
        }
      },
      child: ElevatedButton(
        onPressed: () {
          counterBloc.add(CounterDecrement());
        },
        child: const Icon(Icons.exposure_minus_1),
      ),
    );
  }

  ScaffoldFeatureController buildInfoLayout(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(text))
      );
}
