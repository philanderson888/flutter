import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final url = "https://jsonplaceholder.typicode.com/posts";
  final postObject = {"title": "A Post", "body": "Post Data", "userId": "1001"};

  void _postData() async {
    try {
      final response = await post(Uri.parse(url), body: postObject);
      print('\n\npost data - response is \n\n');
      print(response.body);
    } catch (error) {
      print('error ' + error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('this is an app')),
        body: Center(
          child: ElevatedButton(
            child: const Text('press to post API data'),
            onPressed: () {
              print('hello');
              _postData();
            },
          ),
        ),
      ),
    );
  }
}
