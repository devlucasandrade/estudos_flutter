import 'package:flutter/material.dart';

class CardModelo extends StatelessWidget {
  const CardModelo({
    Key? key,
    required this.texto,
    required this.link,
  }) : super(key: key);

  final String texto;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      elevation: 10,
      child: TextButton(
        onPressed: () => Navigator.of(context).pushNamed(link),
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
