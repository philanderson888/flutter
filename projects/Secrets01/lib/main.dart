import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secrets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Secrets Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var apiKey = '456';

  getApiKey() async {

    print('getting api key');
    var apiKeyFromDotEnvFile = await dotenv.load(fileName: '.env');
    var apiKeyFromDotEnv = env['MYSECRET'];
    print('api key $apiKeyFromDotEnv');

    setState((){
      apiKey += '123';
    });
    return apiKey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex:1,
              child: Center(child:Text('You have pushed the button this many times:'),),
            ),
            Expanded(
              flex:1,
              child: Center(child:Text('22'),),
            ),
            Expanded(
              flex:1,
              child: GestureDetector(
                onTap: getApiKey,
                child: Center(child:Text('press to get api key'),),
              ),
            ),
            Expanded(
              flex:1,
              child: Center(child:Text(apiKey),)
            ),
          ],
        ),
      ),
    );
  }
}
