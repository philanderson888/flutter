/// the goal of this app is to be an all-in-one demo app with as many features built into one app as possible
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToPage2() {
      print('you clicked');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const Page2()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xffaabbcc),
      ),
      body: Center(
        child: ElevatedButton(
          key: null,
          onPressed: goToPage2,
          child: const Text('P2'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToPage3() {
      print('p3');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const Page3()),
      );
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2 - GridView'),
      ),
      body: GridView.count(
        crossAxisCount: 5,
        children: List.generate(20, (index) {
          if (index == 0) {
            return ElevatedButton(
                key: null, onPressed: goToPage3, child: const Text('P3'));
          } else if (index == 1) {
            return ElevatedButton(
                key: null, onPressed: goBack, child: const Text('P2'));
          } else {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            );
          }
        }),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToPage4() {
      print('going to page 4');
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const Page4()),
      );
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('P3 GridView'),
      ),
      body: GridView.count(
        crossAxisCount: 5,
        children: List.generate(20, (index) {
          if (index == 0) {
            return ElevatedButton(
                key: null, onPressed: goToPage4, child: const Text('P4'));
          } else if (index == 1) {
            return ElevatedButton(
                key: null, onPressed: goBack, child: const Text('P2'));
          } else {
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Item $index',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Image(
                      image: NetworkImage(
                          'https://picsum.photos/60?random=$index'),
                    ),
                  ]),
            );
          }
        }),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    goToPage5() {
      print('going to stateful page 5');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Page5()));
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                key: null, onPressed: goToPage5, child: const Text('P5')),
            ElevatedButton(
                key: null, onPressed: goBack, child: const Text('Back')),
          ],
        ),
      ),
    );
  }
}

class Page5 extends StatefulWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Page5State createState() => Page5State();
}

class Page5State extends State {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    incrementCounter() {
      setState(() => {counter++});
      print('incrementing counter to $counter');
    }

    goBack() {
      print('going back');
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Stateful Page 5 - Counter $counter')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                key: null,
                onPressed: incrementCounter,
                child: Text('Increment Counter $counter')),
            ElevatedButton(
                key: null, onPressed: goBack, child: const Text('Back')),
          ],
        ),
      ),
    );
  }
}
