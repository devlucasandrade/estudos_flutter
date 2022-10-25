import 'package:flutter/material.dart';
import '../../components/card_modelo.dart';

class JsonphList extends StatelessWidget {
  const JsonphList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{JSON} Placeholder'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue.shade200,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          children: const [
            CardModelo(
              texto: '/posts',
              link: '/jsonposts',
            ),
            CardModelo(
              texto: '/photos',
              link: '/jsonphotos',
            ),
            CardModelo(
              texto: '/todos',
              link: '/jsontodos',
            ),
            CardModelo(
              texto: '/users',
              link: '/jsonusers',
            ),
          ],
        ),
      ),
    );
  }
}
