import 'dart:convert';
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
  var _postsJson = [];

  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      print('\n\nresponse.body = ');
      print(response.body);
      // response.body is a string to have to parse to JSON or map to dart array
      final jsonData = jsonDecode(response.body) as List;
      print('json data');
      print(jsonData[0]);
      setState(() {
        _postsJson = jsonData;
      });
    } catch (error) {
      print('error' + error.toString());
    }
  }

  // initState() is our stateful widget initialiser
  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('this is an app')),
            body: ListView.builder(
                itemCount: _postsJson.length,
                // builds a dynamic list of items on the fly
                // i is the index of the list we are building
                itemBuilder: (context, i) {
                  final post = _postsJson[i];
                  print('\n\n' + post.toString());
                  return Text(
                      'Title: ${post["title"]} \n Body: ${post["body"]}\n\n');
                })));
  }
}
