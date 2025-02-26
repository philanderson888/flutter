import 'package:flutter/material.dart';
void main() => runApp(const App());
class App extends StatelessWidget {
  const App({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'An App',
      home: Scaffold(
        appBar:AppBar(title: const Text('An App')),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget{
  const Home({Key? key}):super(key:key);
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home>{
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('This is a form'),
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () => print('pressed'),
          ),
          Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email'
                  ),
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return 'mandatory field';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () => {
                      if(_key.currentState!.validate()){
                        print('submit')
                      } else {
                        print('dont submit')
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ]
            ),
          ),
        ],
      )
    );
  }
}
