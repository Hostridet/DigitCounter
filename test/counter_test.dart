import 'package:dz_bloc/bloc/CounterBloc/counter_bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main()
{
  mainBloc();
}

void  mainBloc()
{
  group("Counter", () {
    blocTest<CounterBloc, int>(
        'Nothing changed',
        build: () => CounterBloc(),
        expect: () => const <int>[],
    );

    blocTest<CounterBloc, int>(
        "one increment",
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(CounterIncrement()),
        expect: () => const <int>[1],
    );

    blocTest<CounterBloc, int>(
      "one decrement",
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(CounterDecrement()),
      expect: () => const <int>[-1],
    );

    blocTest<CounterBloc, int>(
      "one increment and one decrement",
      build: () => CounterBloc(),
      act: (bloc) {
        bloc.add(CounterIncrement());
        bloc.add(CounterDecrement());
      },
      expect: () => const <int>[1, 0],
    );

    blocTest<CounterBloc, int>(
      "Clear",
      build: () => CounterBloc(),
      act: (bloc) {
        bloc.add(CounterIncrement());
        bloc.add(CounterNull());
      },
      expect: () => const <int>[1, 0],
    );
  } );
}

