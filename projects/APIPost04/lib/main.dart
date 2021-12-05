// to be completed
// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class Post {
  int id;
  String title, body, userId;

  // default constructor
  Post()
      : id = 0,
        title = '',
        body = '',
        userId = '';

  // constructor with values
  Post.overloadedConstructor(this.id, this.title, this.body, this.userId);

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'userId': userId,
      };
}

class _AppState extends State<App> {
  final url = "https://jsonplaceholder.typicode.com/posts";
  final _postObject = {
    'title': 'A Post',
    'body': 'Post Data',
    'userId': "1001",
  };

  var _responseObject = Post();

  void _updatePostResponse(Map<String, dynamic> apiResponse) {
    setState(() {
      _responseObject.id = apiResponse['id'];
    });
  }

  void _postData() async {
    try {
      final response =
          await post(Uri.parse(url), body: jsonEncode(_postObject));
      print('\n\npost data - response is \n\n');
      Map<String, dynamic> apiResponse = jsonDecode(response.body);
      print('api response body = $apiResponse');
      _updatePostResponse(apiResponse);
    } catch (error) {
      print('error ' + error.toString());
    }
  }

  void _updateTitle(String title) {
    setState(() {
      _responseObject.title = title;
      print('title = $title');
    });
  }

  void _updateBody(String body) {
    setState(() {
      _responseObject.body = body;
      print('body = $body');
    });
  }

  void _updateUserId(String userId) {
    setState(() {
      _responseObject.userId = userId;
      print('userId = $userId');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('this is an app')),
          body: ListView(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            children: <Widget>[
              ElevatedButton(
                child: const Text('press to post API data'),
                onPressed: () {
                  _postData();
                },
              ),
              Text(
                  'id : ${_responseObject.id.toString()}, title: ${_responseObject.title}, body: ${_responseObject.body}, userId: ${_responseObject.userId}'),
              TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                  ),
                  onChanged: (title) {
                    _updateTitle(title);
                  }),
              TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Body',
                  ),
                  onChanged: (body) {
                    _updateBody(body);
                  }),
              TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'UserId',
                  ),
                  onChanged: (userId) {
                    _updateUserId(userId);
                  }),
            ],
          )),
    );
  }
}
