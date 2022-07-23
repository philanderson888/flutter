import 'package:flutter/material.dart';
import '../constants.dart';

class Padding01 extends StatelessWidget {
  const Padding01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Card'),
      ),
      backgroundColor: Colors.teal.shade600,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 0,
            ),
            CircleAvatar(
              radius: 75,
              backgroundColor: kColorLightPink01,
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/philanderson888/data/master/images/2015-guessed-the-year-dad.png'),
            ),
            Text('Phil Anderson', style: kPacifico55White),
            Text(
              'FLUTTER DEVELOPER',
              style: kSourceSansPro35Teal,
            ),
            Container(
              height: 5,
            ),
            Card(
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: kDarkTeal,
                      size: 30,
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(
                      '+447888849991',
                      style: kSourceSansPro30TealDark,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: kDarkTeal,
                    size: 30,
                  ),
                  Container(
                    width: 20,
                  ),
                  Text(
                    'philanderson888@hotmail.com',
                    style: kSourceSansPro30TealDark,
                  ),
                ],
              ),
            ),
          ],
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
