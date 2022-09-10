import 'package:flutter/material.dart';
import 'grid_components.dart';
import 'package:flutter_teaching_app/constants.dart';

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
          //  Features
          //
          Expanded(
            flex: 1,
            child: ElevatedButton(
              key: null,
              onPressed: goToGridAToZ,
              style: kAppHeaderButtonStyle,
              child: Text(
                'Features',
                style: kAppHomePageHeader,
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
                Navigator.pushNamed(context, '/apps');
              },
              style: kAppHeaderButtonStyle,
              child: Text(
                kApps,
                style: kAppHomePageHeader,
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
              style: kAppHeaderButtonStyle,
              child: Text(
                'Templates, Layouts, Features With Text Output, OOP',
                style: kAppHomePageHeader,
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
              style: kAppHeaderButtonStyle,
              child: Text(
                'Stateless Page',
                style: kAppHomePageHeader,
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
              style: kAppHeaderButtonStyle,
              child: Text(
                'Stateful Page With Counter',
                style: kAppHomePageHeader,
              ),
            ),
          ),

          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
