import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  static bool isMoblie(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1000;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
