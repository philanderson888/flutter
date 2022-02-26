import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text('an app'),
      ),
      body: Center(
        child: const Text('an app'),
      ),
    ),
  ));
}
