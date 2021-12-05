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
        title = 'this is a title',
        body = 'this is a body',
        userId = 'this is a user id';

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

  var _postInstance = Post(); 

  void _updatePostResponse(Map<String, dynamic> apiResponse) {
    setState(() {
      _postInstance.id = apiResponse['id'];
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

  void _putData() async {
    try {
      final response = await put((Uri.parse(url + '/1')), body: jsonEncode(_postInstance));
      print('\n\npost data - response is \n\n');
      Map<String, dynamic> apiResponse = jsonDecode(response.body);
      print('api response body after put = $apiResponse');
    } catch (error) {
      print('error ' + error.toString());
    }
  }

  void _deleteData() async {
    try {
      final response = await delete(Uri.parse(url + '/1'));
      print('\n\ndelete data - response is \n\n');
      Map<String, dynamic> apiResponse = jsonDecode(response.body);
      print('api response body after delete = $apiResponse');
    } catch (error) {
      print('error ' + error.toString());
    }
  }

  void _updateTitle(String title) {
    setState(() {
      _postInstance.title = title;
      print('title = $title');
    });
  }

  void _updateBody(String body) {
    setState(() {
      _postInstance.body = body;
      print('body = $body');
    });
  }

  void _updateUserId(String userId) {
    setState(() {
      _postInstance.userId = userId;
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
              ElevatedButton(
                child: const Text('press to put API data'),
                onPressed: () {
                  _putData();
                },
              ),              
              ElevatedButton(
                child: const Text('press to delete API data'),
                onPressed: () {
                  _deleteData();
                },
              ),
              Text(
                  'id : ${_postInstance.id.toString()}, title: ${_postInstance.title}, body: ${_postInstance.body}, userId: ${_postInstance.userId}'),
              TextFormField(
                initialValue: _postInstance.title,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title',
                  ),
                  onChanged: (title) {
                    _updateTitle(title);
                  }),
              TextFormField(
                  initialValue: _postInstance.body,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Body',
                  ),
                  onChanged: (body) {
                    _updateBody(body);
                  }),
              TextFormField(
                  initialValue: _postInstance.userId,
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
