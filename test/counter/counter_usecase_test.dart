import 'package:aula_arquitetura/counter/counter_entity.dart';
import 'package:aula_arquitetura/counter/counter_repository.dart';
import 'package:aula_arquitetura/counter/counter_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CounterUseCase.incrementCounter', () async {
    CounterRepositoryTest counterRepository = CounterRepositoryTest();
    CounterUseCase counterUseCase = CounterUseCase(counterRepository);

    CounterEntity counter = CounterEntity(value: 10);
    CounterEntity newCounter = await counterUseCase.incrementCounter(counter);
    expect(newCounter.value, 11);
    expect(counterRepository.saveCounterCount, 1);
  });

  test('CounterUseCase.loadCounter', () async {
    CounterRepositoryTest counterRepository = CounterRepositoryTest();
    CounterUseCase counterUseCase = CounterUseCase(counterRepository);

    CounterEntity counter = await counterUseCase.loadCounter();
    expect(counter.value, 55);
    expect(counterRepository.getCounterCount, 1);
  });
}

class CounterRepositoryTest extends CounterRepositoryInterface {
  int getCounterCount = 0;
  @override
  Future<CounterEntity> getCounter() async {
    getCounterCount++;
    return CounterEntity(value: 55);
  }

  int saveCounterCount = 0;
  @override
  Future<bool> saveCounter(CounterEntity counter) async {
    saveCounterCount++;
    return true;
  }
}
