# creating simple projects

## contents
- [creating simple projects](#creating-simple-projects)
  - [contents](#contents)
  - [folder structure](#folder-structure)
  - [drawers](#drawers)
  - [Themes](#themes)
    - [Scaffold with AppBar only](#scaffold-with-appbar-only)
  - [AppBar](#appbar)


## folder structure

We use the following folder structure when building a simple flutter application.

This structure is implemented by the `scaffold` class

```
Scaffold
  Drawer
    Items 
  Snack Bar
  Bottom Sheets
```


Within a page we will use the following structure

```
Scaffold

  AppBar
    Title

  Body
    Child

  FloatingActionButton
    onPressed
    tooltip
    child
```




## drawers

A drawer is like a menu drop-down item which can be opened and closed programatically

See sample [Drawer](Projects/Drawer01) for an example



## Themes

Themes can be used to set colours

```java
// create
final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightGreenAccent,
);
// use
backgroundColor: Theme.of(ctx).canvasColor,
```



### Scaffold with AppBar only

```java
class Home extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Text('some text')
    );
  }
}
```


## AppBar

Appears at the top of the screen

```java
appBar: AppBar(
  backgroundColor: Theme.of(ctx).canvasColor,
  elevation:1.0,
),
```