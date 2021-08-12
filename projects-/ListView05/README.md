# ListView05

This ListView builds a dynamic ListView where rows can be added and removed dynamically

Starting off with [ListView04](../ListView04) as the template

This app dynamically adds another row above the one that has been clicked.

Also long clicking an item removes it.  

Wow!

```java
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListViews',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('ListViews')),
        body: BodyLayout(),
      ),
    );
  }
}
class BodyLayout extends StatefulWidget {
    @override
    BodyLayoutState createState() {
    return new BodyLayoutState();
    }
}
class BodyLayoutState extends State<BodyLayout> {
    List<String> titles = ['Sun', 'Moon', 'Star'];
    @override
    Widget build(BuildContext context) {
    return _myListView();
    }
    Widget _myListView() {
    return ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
        final item = titles[index];
        return Card(
            child: ListTile(
            title: Text(item),

            onTap: () { //                                  <-- onTap
                setState(() {
                titles.insert(index, 'Planet');
                });
            },

            onLongPress: () { //                            <-- onLongPress
                setState(() {
                titles.removeAt(index);
                });
            },

            ),
        );
        },
    );
    }
}
```
