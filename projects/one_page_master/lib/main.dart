import 'package:flutter/material.dart';
void main() => {
  runApp(MaterialApp(
    home:MyApp(),
    theme:theme,
  )
  )
};

// create a colour
final ThemeData theme = ThemeData(
  canvasColor: Colors.lightGreenAccent,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amberAccent),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx){
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: (){
              Navigator.push(ctx,PageTwo());
            },
            child:Text('Go to page 2')
        ),
      ),
    );
  }
}

// Material Page Route allows us to replace the screen with new transitional screen
// on button click go to new page but original page stays in memory
// can remove from memory by setting maintain state = false
// null means route returns nothing as there is no state to return
class PageTwo extends MaterialPageRoute<Null>{
  // constructor - can pass in items if we want
  PageTwo(): super(builder:(BuildContext ctx){
    // return element we are creating
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(ctx).canvasColor,
        elevation:1.0,
      ),
      body:Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
                ctx,
                PageThree()
            );
          },
          child: Text('Go to page 3'),
        ),
      ),
    );
  });
}


class PageThree extends MaterialPageRoute<Null>{
  // constructor - can pass in items if we want
  PageThree(): super(builder:(BuildContext ctx){
    // return element we are creating
    return Scaffold(
      appBar: AppBar(
        title: Text('last page'),
        backgroundColor: Theme.of(ctx).backgroundColor,
        elevation:2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              Navigator.pop(ctx);
            },
          ),
        ],
      ),
      body:Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.popUntil(
                ctx,
                ModalRoute.withName(Navigator.defaultRouteName)
            );
          },
          child: Text('Go Home!'),
        ),
      ),
    );
  });
}
