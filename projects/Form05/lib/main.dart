import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:date_time_picker/date_time_picker.dart';
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
  TextEditingController _dateTimeController01 = TextEditingController();
  TextEditingController _dateTimeController02 = TextEditingController();

  int _counter01 = 3;
  int _counter02 = 3;
  String _date01 = '2021-09-20 14:30';
  String _date02 = '2021-09-20 14:30';

  @override
  void initState(){
    super.initState();
    _controller01.text = _counter01.toString();
    _controller02.text = _counter02.toString();
    _textFieldController.text = 'some text';
    _dateTimeController01.text = _date01;
    _dateTimeController02.text = _date02;
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

  dateChanged01(val){
    setState(() => {
      _date01 = val
    });
    print('date01 changed to $_date01');
  }

  dateChanged02(val){
    setState(() => {
      _date02 = val ?? ''
    });
    print('date02 changed to $_date02');
  }

  String? validateDate01(String? value){
    return null;
  }

  String? validateDate02(String? value){
    return null;
  }

  validateForSubmission(){
    if(_key.currentState!.validate()){
      print('submit ${(_counter01 + _counter02).toString()}');
      print('date 1 $_date01');
      print('date 2 $_date02');
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
              SizedBox(
                width: 400,
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  icon: Icon(Icons.event),
                  dateMask: 'd MMM, yyyy',
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2022),
                  controller: _dateTimeController01,
                  dateLabelText: 'Date',
                  timeLabelText: 'Time',
                  onChanged: dateChanged01,
                  validator: validateDate01,
                ),
              ),
              SizedBox(
                width: 400,
                child: DateTimePicker(
                  type: DateTimePickerType.date,
                  icon: Icon(Icons.event),
                  dateMask: 'd MMM, yyyy',
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2022),
                  controller: _dateTimeController02,
                  dateLabelText: 'Date',
                  timeLabelText: 'Time',
                  onChanged: dateChanged02,
                  validator: validateDate02,
                ),
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
