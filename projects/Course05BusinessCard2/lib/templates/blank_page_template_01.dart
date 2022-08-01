import 'package:flutter/material.dart';
import 'package:flutter_teaching_app/constants.dart';

class BlankPageTemplate extends StatelessWidget {
  const BlankPageTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blank Page Template'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kDarkTeal,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}
