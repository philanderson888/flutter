import 'package:flutter/material.dart';

class BmiCalculator01 extends StatefulWidget {
  const BmiCalculator01({Key? key}) : super(key: key);

  @override
  State<BmiCalculator01> createState() => _BmiCalculator01State();
}

class _BmiCalculator01State extends State<BmiCalculator01> {
  @override
  Widget build(BuildContext context) {
    doNothing() {
      print('doing nothing');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Row(),
      floatingActionButton: FloatingActionButton(
        onPressed: doNothing,
        child: const Icon(Icons.add),
      ),
    );
  }
}
