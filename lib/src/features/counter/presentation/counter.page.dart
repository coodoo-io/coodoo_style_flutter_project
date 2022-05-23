import 'package:coodoo_style_flutter_project/src/core/ui/widgets/app_error.widget.dart';
import 'package:coodoo_style_flutter_project/src/core/ui/widgets/loading.widget.dart';
import 'package:coodoo_style_flutter_project/src/features/counter/presentation/counter.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coodoo Style Flutter Project'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 16),
            ref.watch(counterControllerProvider).value.when(
                data: (data) => Text(
                      '$data',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                error: (e, st) => AppError(error: e),
                loading: () => const Loading(radius: 26))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                ref.read(counterControllerProvider.notifier).decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () =>
                ref.read(counterControllerProvider.notifier).increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
