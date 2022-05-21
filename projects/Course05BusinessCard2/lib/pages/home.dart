import 'package:flutter/material.dart';
import 'gridAtoZ.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToGridAToZ() {
      print('you clicked');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const GridAToZ()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Amazing Flutter Teaching App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(),
          ElevatedButton(
            key: null,
            onPressed: goToGridAToZ,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
            ),
            child: Text(
              'Teaching Grid A-Z',
              style: TextStyle(
                fontSize: 35,
                fontFamily: "SourceSansPro",
                color: Colors.teal.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
