import 'package:aula_arquitetura/counter/counter_entity.dart';
import 'package:aula_arquitetura/counter/counter_use_case.dart';
import 'package:flutter/material.dart';

abstract class CounterControllerInterface extends ChangeNotifier {
  CounterControllerInterface();

  CounterEntity get counter;
  bool get isLoaded;
  bool get isNotLoaded;

  incrementCounter();

  loadCounter();
}

class CounterController extends CounterControllerInterface {
  final CounterUseCaseInterface counterUseCase;

  CounterController(this.counterUseCase);

  CounterEntity _counter = CounterEntity(value: 0);
  @override
  get counter => _counter;

  bool _isLoaded = false;
  @override
  get isLoaded => _isLoaded;
  @override
  get isNotLoaded => !_isLoaded;

  @override
  incrementCounter() async {
    _counter = await counterUseCase.incrementCounter(_counter);
    notifyListeners();
  }

  @override
  loadCounter() {
    _isLoaded = false;
    notifyListeners();
    counterUseCase.loadCounter().then((newCounter) {
      _counter = newCounter;
      _isLoaded = true;
      notifyListeners();
    });
  }
}
