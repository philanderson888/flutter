# forms

## contents

- [forms](#forms)
  - [contents](#contents)
  - [introduction](#introduction)
  - [form with single field](#form-with-single-field)
  - [textfield](#textfield)
  - [textformfield](#textformfield)
  - [form example - text and numbers](#form-example---text-and-numbers)

## introduction

flutter forms can have inbuilt validation which is great from the coder and the user point of view

## form with single field

here is a sample [form](../projects/Form03) with just one field, but it does have validation

```java
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
    String validateEmail(String? value) {
      String pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$";
      RegExp regex = RegExp(pattern);
      if (value == null || value.isEmpty || !regex.hasMatch(value))
        return 'Enter a valid email address';
      else
        return null;
    }
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
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email Basic Validation'
                  ),
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return 'mandatory field';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Email Advanced Validation'
                  ),
                  validator: (value) => validateEmail(value),
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
```


## textfield

see [TextField01](../projects/TextField01)

```java
TextField(
  decoration: const InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Enter some text here'
  ),
  onChanged: (text) => print('You entered text $text'),
),
```

for a combination of a text input field which updates a label see [TextField02](../projects/TextField02)

```java
String _inputText = '';
void _updateTextLabel(inputText) {
  setState(() {
    _inputText = inputText;
  });
  print('text field has been updated to $_inputText');
}
TextField(
  decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Enter some text here'),
  onChanged: (inputText) => {
    _updateTextLabel(inputText)
  }
),
const Text(
  'This is a text field',
),
Text(
  _inputText,
),
```

## textformfield

these fields are required when the form is going to be validated, otherwise just use simple [textfield](#textfield)

When we display the form, sometimes we wish to display the index field as well as a read-only field but also colour it slightly to indicate clearly to the user that it's a different kind of field so if they do click on it to change it, they can understand clearly that it's a read only field

```java
Container(
  width: 500,
  child: TextFormField(
    enabled: false,
    initialValue: album.id.toString(),
    decoration: const InputDecoration(
      fillColor: Color(0xffb5e6e1),
      filled: true,
      border: OutlineInputBorder(),
      hintText: 'album id'
    ),
  ),
),
```

## form example - text and numbers

here is a complete form example taken from [Form04](../projects/Form04) 

```java
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  TextEditingController _controller01 = TextEditingController();
  TextEditingController _controller02 = TextEditingController();
  TextEditingController _textFieldController = TextEditingController();

  int _counter01 = 3;
  int _counter02 = 3;

  @override
  void initState(){
    super.initState();
    _controller01.text = _counter01.toString();
    _controller02.text = _counter02.toString();
    _textFieldController.text = 'some text';
  }

  void incrementCounter01(){
    setState(() => {
      _counter01 = ((_counter01 += 3) ~/ 3) * 3
    });
    setState(() => {
      _controller01.text = _counter01.toString()
    });
  }

  void decrementCounter01(){
    setState(() => {
      _counter01 = ((_counter01 -= 3) ~/ 3) * 3
    });
    setState(() => {
      _controller01.text = _counter01.toString()
    });
  }

  void incrementCounter02(){
    setState(() => {
      _counter02 = ((_counter02 += 3) ~/ 3) * 3
    });
    setState(() => {
     _controller02.text = _counter02.toString()
    });
  }

  void decrementCounter02(){
    setState(() => {
      _counter02 = ((_counter02 -= 3) ~/ 3) * 3
    });
    setState(() => {
      _controller02.text = _counter02.toString()
    });
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }

  String? validateNumber(String? value){
    if (value == null)
      return null;
    else if (int.parse(value) <= 0)
      return 'Enter a positive non-zero number';
    else if (int.parse(value) > 99)
      return 'Number must be less than 100';
    else
      return null;
  }

  validateForSubmission(){
    if(_key.currentState!.validate()){
      print('submit ${(_counter01 + _counter02).toString()}');
    } else {
      print('dont submit');
    }
  }

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('This is a form'),
        IconButton(
          icon: const Icon(Icons.add_alert),
          onPressed: () => print('pressed'),
        ),
        Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _textFieldController,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'), allow: true)
                ],
                decoration: InputDecoration(
                    labelText: 'name (letters a-z)',
                    helperText: 'Only accept letters from a to z',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))
                ),
              ),
              TextFormField(
                initialValue: 'some content',
                decoration: const InputDecoration(
                  hintText: 'field must have any content present',
                  labelText: 'field must have any content present',
                ),
                validator: (String? value){
                  if (value == null || value.isEmpty){
                    return 'mandatory field';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: '123@email.com',
                decoration: const InputDecoration(
                  hintText: 'Email'
                ),
                validator: (value) => validateEmail(value),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: _controller01,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                        labelText: "number (step 3)",
                        hintText: "any number (step 3)",
                        icon: Icon(Icons.phone_iphone)
                      ), 
                      validator: (value) => validateNumber(value),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                      ),
                      iconSize: 16.0,
                      onPressed: incrementCounter01,
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      icon: Icon(
                        Icons.remove,
                      ),
                      iconSize: 16.0,
                      onPressed: decrementCounter01,
                    ),  
                  ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: _controller02,
                      keyboardType: TextInputType.numberWithOptions(decimal: true,signed: false),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: const InputDecoration(
                        hintText: 'number (step 3)',
                        labelText: 'number (step 3)',
                      ),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                      ),
                      iconSize: 16.0,
                      onPressed: incrementCounter02,
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      icon: Icon(
                        Icons.remove,
                      ),
                      iconSize: 16.0,
                      onPressed: decrementCounter02,
                    ),  
                  ),
                ]
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: validateForSubmission,
                  child: const Text('Submit'),
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }
}
```