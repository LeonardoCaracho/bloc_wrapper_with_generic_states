import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_wrapper.dart';
import 'blocs/bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<RandomBloc>(
        create: (context) => RandomBloc(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocWrapper<RandomBloc, RandomLoadSuccess>(
            loading: (context) => const Center(child: CircularProgressIndicator()),
            initial: (context) => const Center(child: Text('Press the button to generate a random number')),
            failure: (context) => const Center(child: Text('This is a failure state')),
            success: (context, state) => Center(
              child: Text('${state.value}', style: Theme.of(context).textTheme.headline4),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<RandomBloc>().add(RandomGeneratePressed()),
        tooltip: 'Generate',
        child: const Icon(Icons.radio_button_off_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
