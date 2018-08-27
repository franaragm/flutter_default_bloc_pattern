import 'package:flutter/material.dart';
import 'package:flutter_default_bloc_pattern/blocs/counter_bloc.dart';

class CounterProvider extends InheritedWidget {
  final CounterBloc bloc;

  CounterProvider({Key key, Widget child})
      : bloc = CounterBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static CounterBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider) as CounterProvider).bloc;
  }
}
