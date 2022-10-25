import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import './counter.dart';

final counter = Counter();

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter View'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Contagem de vezes que aperta os botões: \n'),
            Observer(
              builder: (_) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: counter.increment,
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
                ElevatedButton(
                  onPressed: counter.decrement,
                  child: const Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
