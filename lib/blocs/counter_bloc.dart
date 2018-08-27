import 'package:flutter_default_bloc_pattern/model/counter_model.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc {
  final counterModel = CounterModel();

  final _bsIncrement = BehaviorSubject<int>();
  final _bsCount = BehaviorSubject<int>();

//Getters to Sink
  Function get incrementSink => _bsIncrement.sink.add;
  Function get countSink => _bsCount.sink.add;

//Getters to Streams
  Observable<int> get incrementStream => _bsIncrement.stream;
  Observable<int> get countStream => _bsCount.stream;

  CounterBloc() {
    incrementStream.listen((value) {
      counterModel.increaseValue(value);
      countSink(counterModel.count);
    });
  }

  void dispose() {
    _bsIncrement.close();
    _bsCount.close();
  }
}
