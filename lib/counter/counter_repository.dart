import 'dart:convert';

import 'package:aula_arquitetura/counter/counter_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CounterRepositoryInterface {
  Future<bool> saveCounter(CounterEntity counter);

  Future<CounterEntity> getCounter();
}

class CounterRepositorySharedPrefs extends CounterRepositoryInterface {
  @override
  Future<bool> saveCounter(CounterEntity counter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> json = counter.toJson();
    String valueToSave = jsonEncode(json);
    prefs.setString("counter", valueToSave);
    return true;
  }

  @override
  Future<CounterEntity> getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedValue = prefs.getString("counter") ?? "{}";
    Map<String, dynamic> json = jsonDecode(savedValue);
    CounterEntity counter = CounterEntity.fromJson(json);
    return counter;
  }
}
