import 'package:flutter/material.dart';

class ToggleButton01 extends StatefulWidget {
  const ToggleButton01({Key? key}) : super(key: key);

  @override
  State<ToggleButton01> createState() => _ToggleButton01State();
}

class _ToggleButton01State extends State<ToggleButton01> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('toggle button'));
  }
}
