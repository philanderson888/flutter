# ListView02

## Introduction

This builds on [ListView01](../ListView01)

It is building a dynamic list this time where as before we were building a fixed list

Using this page as a lead guide

https://pusher.com/tutorials/flutter-listviews

## Contents

- [ListView02](#listview02)
  - [Introduction](#introduction)
  - [Contents](#contents)
  - [Boilerplate code](#boilerplate-code)
  - [Basic List View](#basic-list-view)
  - [With Dividers](#with-dividers)
  - [Dynamic ListView](#dynamic-listview)
  - [Infinite List](#infinite-list)
  - [Separated Infinite List](#separated-infinite-list)
  - [Horizontal List View](#horizontal-list-view)
  - [Adding Icon Images](#adding-icon-images)
  - [Adding Real Images](#adding-real-images)
  - [ListView of Cards](#listview-of-cards)
    - [Listview of Cards with multiple columns in each card](#listview-of-cards-with-multiple-columns-in-each-card)

## Boilerplate code

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
class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}
Widget _myListView(BuildContext context) {
  return ListView();
}
```

## Basic List View

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
class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}
Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Sun'),
      ),
      ListTile(
        title: Text('Moon'),
      ),
      ListTile(
        title: Text('Star'),
      ),
    ],
  );
}
```

## With Dividers

```java
Widget _myListView(BuildContext context) {
  return ListView(
    children: ListTile.divideTiles(
      context: context,
      tiles: [
        ListTile(
          title: Text('Sun'),
        ),
        ListTile(
          title: Text('Moon'),
        ),
        ListTile(
          title: Text('Star'),
        ),
      ],
    ).toList(),
  );
}
```


## Dynamic ListView

```java
Widget _myListView(BuildContext context) {
  final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria', 
    'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
    'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
    'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
    'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
    'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
    'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
    'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden', 
    'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];
  return ListView.builder(
    itemCount: europeanCountries.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(europeanCountries[index]),
      );
    },
  );
}
```


## Infinite List

```java
Widget _myListView(BuildContext context) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('row $index'),
      );
    },
  );
}
```


## Separated Infinite List

```java
Widget _myListView(BuildContext context) {
  return ListView.separated(
    itemCount: 1000,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('row $index'),
      );
    },
    separatorBuilder: (context, index) {
      return Divider();
    },
  );
}
```

## Horizontal List View

```java
Widget _myListView(BuildContext context) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        color: Colors.tealAccent,
        child: Text('$index'),
      );
    },
  );
}
```


## Adding Icon Images

```java
Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text('Sun'),
      ),
      ListTile(
        leading: Icon(Icons.brightness_3),
        title: Text('Moon'),
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('Star'),
      ),
      ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text('Sun'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    ],
  );
}
```


## Adding Real Images

```java
Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://cdn3.iconfinder.com/data/icons/capsocial-round/500/facebook-512.png'),
        ),
        title: Text('Facebook'),
        subtitle: Text('93 million miles away'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://images.techhive.com/images/article/2016/02/twitter-icon-logo-100644740-large.jpg'),
        ),
        title: Text('Twitter'),
        subtitle: Text('93 million miles away'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Linkedin_icon.svg/1024px-Linkedin_icon.svg.png'),
        ),
        title: Text('LinkedIn'),
        subtitle: Text('93 million miles away'),
      ),
    ],
  );
}
```

## ListView of Cards

```java
Widget _myListView(BuildContext context) {
  final titles = ['bike', 'boat', 'bus', 'car',
  'railway', 'run', 'subway', 'transit', 'walk'];
  final icons = [Icons.directions_bike, Icons.directions_boat,
  Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
  Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
  Icons.directions_walk];
  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card( 
        child: ListTile(
          leading: Icon(icons[index]),
          title: Text(titles[index]),
        ),
      );
    },
  );
}
```


### Listview of Cards with multiple columns in each card

```java
Widget _myListView(BuildContext context) {
  // the Expanded widget lets the columns share the space
  Widget column = Expanded(
    child: Column(
      // align the text to the left instead of centered
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Title', style: TextStyle(fontSize: 16),),
        Text('subtitle'),
      ],
    ),
  );
  return ListView.builder(
    itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              column,
              column,
            ],
          ),
        ),
      );
    },
  );
}
```