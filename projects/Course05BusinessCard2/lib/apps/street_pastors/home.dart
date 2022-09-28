import 'package:flutter/cupertino.dart';
import 'package:flutter_teaching_app/constants.dart';

class StreetPastors extends StatefulWidget {
  const StreetPastors({Key? key}) : super(key: key);

  @override
  State<StreetPastors> createState() => _StreetPastorsState();
}

class _StreetPastorsState extends State<StreetPastors> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Center(
              child: Text('Street Pastors'),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}
