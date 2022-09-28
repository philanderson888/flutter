import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'login.dart';
import 'package:flutter_teaching_app/constants.dart';

class StreetPastors extends StatefulWidget {
  const StreetPastors({Key? key}) : super(key: key);

  @override
  State<StreetPastors> createState() => _StreetPastorsState();
}

class _StreetPastorsState extends State<StreetPastors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey002,
                child: Center(
                  child: Text('Street Pastors'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print('register');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StreetPastorsLogin()));
                },
                child: Container(
                  color: kColorLightGrey003,
                  child: Center(
                    child: Text('Register'),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  print('login');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StreetPastorsLogin()));
                },
                child: Container(
                  color: kColorLightGrey003,
                  child: Center(
                    child: Text('Login'),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: kColorLightGrey002,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
