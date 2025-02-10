// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        // Provide the CounterCubit to the widget tree.
        create: (_) => CounterCubit(),
        child: const CounterPage(),
      ),
    );
  }
}

/// The page that displays the counter and the buttons.
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the CounterCubit instance using context.read or context.watch.
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter App'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          // The builder is called whenever the Cubit's state changes.
          builder: (context, count) {
            return Text(
              'Counter: $count',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Button to increment the counter.
          FloatingActionButton(
            heroTag: 'increment',
            child: const Icon(Icons.add),
            onPressed: () => counterCubit.increment(),
          ),
          const SizedBox(height: 8),
          // Button to decrement the counter.
          FloatingActionButton(
            heroTag: 'decrement',
            child: const Icon(Icons.remove),
            onPressed: () => counterCubit.decrement(),
          ),
        ],
      ),
    );
  }
}
