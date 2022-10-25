import 'package:flutter/material.dart';

import '../components/card_modelo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo de APIs'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        color: Colors.grey.shade300,
        child: ListView(
          children: const [
            SizedBox(height: 10),
            CardModelo(
              texto: '{JSON} Placeholder',
              link: '/jsonlist',
            ),
            CardModelo(
              texto: 'Open Weather',
              link: '/openweather',
            ),
            CardModelo(
              texto: 'Studio Ghibli API',
              link: '/ghibliapi',
            ),
          ],
        ),
      ),
    );
  }
}
