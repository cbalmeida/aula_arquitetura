import 'package:aula_arquitetura/counter/counter_entity.dart';

import 'counter_repository.dart';

abstract class CounterUseCaseInterface {
  Future<CounterEntity> incrementCounter(CounterEntity counter);

  Future<CounterEntity> loadCounter();
}

class CounterUseCase extends CounterUseCaseInterface {
  final CounterRepositoryInterface counterRepository;

  CounterUseCase(this.counterRepository);

  @override
  Future<CounterEntity> incrementCounter(CounterEntity counter) async {
    CounterEntity newCounter = counter.incrementValue();
    await counterRepository.saveCounter(newCounter);
    return newCounter;
  }

  @override
  Future<CounterEntity> loadCounter() async {
    CounterEntity counter = await counterRepository.getCounter();
    return counter;
  }
}
