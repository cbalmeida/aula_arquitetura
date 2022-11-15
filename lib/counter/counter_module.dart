import 'package:aula_arquitetura/counter/counter_repository.dart';
import 'package:aula_arquitetura/counter/counter_screen.dart';
import 'package:aula_arquitetura/counter/counter_use_case.dart';
import 'package:flutter/cupertino.dart';

import 'counter_controller.dart';

class CounterModule extends StatefulWidget {
  const CounterModule({super.key});

  @override
  State<CounterModule> createState() => _CounterModuleState();
}

class _CounterModuleState extends State<CounterModule> {
  late CounterControllerInterface counterController;

  @override
  void initState() {
    super.initState();
    CounterRepositoryInterface counterRepository = CounterRepositorySharedPrefs();
    CounterUseCase counterUseCase = CounterUseCase(counterRepository);
    counterController = CounterController(counterUseCase);
    Future.delayed(const Duration(milliseconds: 100), () {
      counterController.loadCounter();
    });
  }

  @override
  void dispose() {
    counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: counterController,
      builder: (context, child) {
        return CounterScreen(controller: counterController);
      },
    );
  }
}
