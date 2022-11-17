import 'package:aula_arquitetura/counter/counter_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CounterEntity - valores iniciais', () {
    /// Arrange
    const initialValue = 50;
    late CounterEntity counterEntity;

    /// Act
    counterEntity = CounterEntity(value: initialValue);

    /// Assert
    expect(counterEntity.value, initialValue);
  });

  test('CounterEntity.fromJson', () {
    CounterEntity counterEntity;

    counterEntity = CounterEntity.fromJson({"value": 50});
    expect(counterEntity.value, 50);

    counterEntity = CounterEntity.fromJson({"value": null});
    expect(counterEntity.value, 0);

    counterEntity = CounterEntity.fromJson({"value": "abc"});
    expect(counterEntity.value, 0);

    counterEntity = CounterEntity.fromJson({"value": DateTime.now()});
    expect(counterEntity.value, 0);
  });

  test('CounterEntity.toJson', () {
    CounterEntity counterEntity;

    counterEntity = CounterEntity.fromJson({"value": 50});

    Map<String, dynamic> json = counterEntity.toJson();
    expect(json, {"value": counterEntity.value});
    expect(json, {"value": 50});
  });

  test('CounterEntity.copyWith', () {
    CounterEntity counterEntity = CounterEntity.fromJson({"value": 50});
    CounterEntity counterEntity2 = counterEntity.copyWith(value: counterEntity.value + 1);
    expect(counterEntity2.value, 51);
  });

  test('CounterEntity.incrementValue', () {
    CounterEntity counterEntity = CounterEntity.fromJson({"value": 50});
    CounterEntity counterEntity2 = counterEntity.incrementValue();
    expect(counterEntity2.value, counterEntity.value + 1);
  });
}
