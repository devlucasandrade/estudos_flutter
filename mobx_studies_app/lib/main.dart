import 'package:flutter/material.dart';
import 'package:mobx_studies_app/formname/form_name_controller.dart';
import 'package:mobx_studies_app/github_repos/github_widgets.dart';
import 'package:mobx_studies_app/todo/todo_widgets.dart';
import 'package:provider/provider.dart';

import 'counter/counter.dart';
import 'dice/dice_widgets.dart';
import 'form/form_widgets.dart';
import 'formname/form_name.dart';
import 'home_page.dart';
import 'counter/counter_widgets.dart';

final counter = Counter();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
        ),
      ],
      child: MaterialApp(
        title: 'Mobx',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/counter': (context) => const CounterView(),
          '/dice': (context) => const DiceExample(),
          '/todos': (context) => const TodoExample(),
          '/form': (context) => const FormExample(),
          '/github': (context) => const GithubExample(),
          '/formname': (context) => const FormName(),
        },
      ),
    );
  }
}
