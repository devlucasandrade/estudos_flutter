import 'package:flutter/material.dart';

class ElevatedButtonLink extends StatelessWidget {
  const ElevatedButtonLink({
    Key? key,
    required this.route,
    required this.textName,
  }) : super(key: key);
  final String route;
  final String textName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        minimumSize: const Size(230, 40),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Text(
        textName,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
