import 'package:flutter/material.dart';
import 'homeIMC.dart';

void main() => runApp(caculadoraIMC());

class caculadoraIMC extends StatelessWidget {
  const caculadoraIMC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeIMC(),
    );
  }
}
