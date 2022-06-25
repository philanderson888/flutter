import 'package:flutter/material.dart';
import 'grid_components.dart';

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
          Expanded(flex: 1, child: Container()),
          //
          //  Teaching Grid (default route)
          //
          Expanded(
            flex: 1,
            child: ElevatedButton(
              key: null,
              onPressed: goToGridAToZ,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              child: Text(
                'Features',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "SourceSansPro",
                  color: Colors.teal.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(flex: 1, child: Container()),
          //
          //  Grid 2
          //
          Expanded(
            flex: 1,
            child: ElevatedButton(
              key: null,
              onPressed: () {
                Navigator.pushNamed(context, '/grid2');
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              child: Text(
                'Flutter Layouts, Templates, Apps, Print Operations, OOP',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "SourceSansPro",
                  color: Colors.teal.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(flex: 1, child: Container()),
          //
          //  Page 4
          //
          Expanded(
            flex: 1,
            child: ElevatedButton(
              key: null,
              onPressed: () {
                Navigator.pushNamed(context, '/page4');
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              child: Text(
                'Stateless Page',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "SourceSansPro",
                  color: Colors.teal.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(flex: 1, child: Container()),
          //
          //  Page 5
          //
          Expanded(
            flex: 1,
            child: ElevatedButton(
              key: null,
              onPressed: () {
                Navigator.pushNamed(context, '/page5');
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              child: Text(
                'Stateful Page With Counter',
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "SourceSansPro",
                  color: Colors.teal.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
