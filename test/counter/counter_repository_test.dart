import 'package:aula_arquitetura/counter/counter_entity.dart';
import 'package:aula_arquitetura/counter/counter_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('CounterRepositorySharedPrefs.getCounter()', () async {
    SharedPreferences.setMockInitialValues({});
    CounterRepositorySharedPrefs counterRepositorySharedPrefs = CounterRepositorySharedPrefs();
    CounterEntity counterEntity = await counterRepositorySharedPrefs.getCounter();
    expect(counterEntity.value, 0);

    SharedPreferences.setMockInitialValues({"counter": '{"value":10}'});
    counterRepositorySharedPrefs = CounterRepositorySharedPrefs();
    counterEntity = await counterRepositorySharedPrefs.getCounter();
    expect(counterEntity.value, 10);
  });

  test('CounterRepositorySharedPrefs.saveCounter()', () async {
    SharedPreferences.setMockInitialValues({});
    CounterRepositorySharedPrefs counterRepositorySharedPrefs = CounterRepositorySharedPrefs();
    CounterEntity counterEntity = CounterEntity(value: 20);
    bool result = await counterRepositorySharedPrefs.saveCounter(counterEntity);
    expect(result, true);
    counterEntity = await counterRepositorySharedPrefs.getCounter();
    expect(counterEntity.value, 20);
  });
}
