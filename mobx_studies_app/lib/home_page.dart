import 'package:flutter/material.dart';

import 'elevatedbtnlink_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ElevatedButtonLink(
              route: '/counter',
              textName: 'Contador',
            ),
            ElevatedButtonLink(
              route: '/dice',
              textName: 'Dados',
            ),
            ElevatedButtonLink(
              route: '/todos',
              textName: 'Lista A FAZER',
            ),
            ElevatedButtonLink(
              route: '/form',
              textName: 'Formulário',
            ),
            ElevatedButtonLink(
              route: '/github',
              textName: 'GitHub Repos',
            ),
            ElevatedButtonLink(
              route: '/formname',
              textName: 'Form Flutterando',
            ),
          ],
        ),
      ),
    );
  }
}
