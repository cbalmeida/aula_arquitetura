import 'package:aula_arquitetura/counter/counter_controller.dart';
import 'package:aula_arquitetura/counter/counter_entity.dart';
import 'package:aula_arquitetura/counter/counter_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CounterController', () {
    CounterUseCaseTest counterUseCase = CounterUseCaseTest();
    CounterController counterController = CounterController(counterUseCase);

    expect(counterController.counter.value, 0);
    expect(counterController.isLoaded, false);
    expect(counterController.isNotLoaded, !counterController.isLoaded);
  });

  test('CounterController.incrementCounter', () async {
    CounterUseCaseTest counterUseCase = CounterUseCaseTest();
    CounterController counterController = CounterController(counterUseCase);

    int notifyListenersCount = 0;
    counterController.addListener(() {
      notifyListenersCount++;
    });

    expect(notifyListenersCount, 0);
    expect(counterController.counter.value, 0);
    await counterController.incrementCounter();
    expect(counterController.counter.value, 1);
    expect(notifyListenersCount, 1);
    expect(counterUseCase.incrementCounterCount, 1);
  });

  test('CounterController.loadCounter', () async {
    CounterUseCaseTest counterUseCase = CounterUseCaseTest();
    CounterController counterController = CounterController(counterUseCase);

    int notifyListenersCount = 0;
    counterController.addListener(() {
      notifyListenersCount++;
    });

    await counterController.loadCounter();
    expect(counterController.counter.value, 40);
    expect(counterController.isLoaded, true);
    expect(notifyListenersCount, 2);
    //expect(counterUseCase.incrementCounterCount, 1);
  });
}

class CounterUseCaseTest extends CounterUseCaseInterface {
  int incrementCounterCount = 0;
  @override
  Future<CounterEntity> incrementCounter(CounterEntity counter) async {
    incrementCounterCount++;
    return counter.incrementValue();
  }

  @override
  Future<CounterEntity> loadCounter() async {
    return CounterEntity(value: 40);
  }
}
