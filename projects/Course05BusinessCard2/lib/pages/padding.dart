import 'package:flutter/material.dart';

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
            const CircleAvatar(
              radius: 75,
              backgroundColor: Colors.black12,
              backgroundImage: NetworkImage(
                  'https://raw.githubusercontent.com/philanderson888/data/master/images/2015-guessed-the-year-dad.png'),
            ),
            const Text(
              'Phil Anderson',
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.w400,
                fontFamily: "Pacifico",
                color: Colors.white,
              ),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                fontSize: 35,
                fontFamily: "SourceSansPro",
                color: Colors.teal.shade100,
                fontWeight: FontWeight.bold,
              ),
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
                      color: Colors.teal.shade800,
                      size: 30,
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(
                      '+447888849991',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "SourceSansPro",
                        color: Colors.teal.shade900,
                        fontWeight: FontWeight.bold,
                      ),
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
                    color: Colors.teal.shade800,
                    size: 30,
                  ),
                  Container(
                    width: 20,
                  ),
                  Text(
                    'philanderson888@hotmail.com',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "SourceSansPro",
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        child: const Text("Back"),
        onPressed: goBack,
      ),
    );
  }
}
