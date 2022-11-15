import 'package:aula_arquitetura/counter/counter_controller.dart';
import 'package:flutter/material.dart';

class CounterProvider extends InheritedWidget {
  final CounterController controller;

  const CounterProvider({super.key, required super.child, required this.controller});

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!;
  }

  static CounterController controllerOf(BuildContext context) {
    return CounterProvider.of(context).controller;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
