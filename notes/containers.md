# containers

## contents

- [containers](#containers)
  - [contents](#contents)
  - [introduction](#introduction)
    - [Body Is A Single Container](#body-is-a-single-container)
    - [body: Center( child:Container()  )  will fill the screen](#body-center-childcontainer----will-fill-the-screen)
    - [Container With Shadow](#container-with-shadow)
    - [animated container](#animated-container)

## introduction

Container must have a parent which is
- Center
- Padding
- Column
- Row
- Scaffold

By default container will fill the screen 

If it has a child the container will take up the width and height of the child



### Body Is A Single Container

```java
class Home extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),
      body: Container
        (
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('some text'),
              Text('some more text').
            ],
          )
        ),
    );
  }
}
```

### body: Center( child:Container()  )  will fill the screen

*Note: container with a parent of Center by default will fill the screen*

```java
Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home Screen")),
      ),   
      body: Center(
        child:Container(
          color: Colors.green,
        ),
      ),
    );
  }
```

### Container With Shadow

*Note : a button cannot have a shadow but must be put in a container which has a shadow*


```java
Container(
  decoration: BoxDecoration(
    boxShadow:[
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),
  child: ElevatedButton(
    autofocus: true,
    clipBehavior: Clip.none,
    onPressed: () => clickButton(),
    color: Colors.blue,
    padding: const EdgeInsets.all(30),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.lightBlue),
    ),
    child: Text(buttonText, 
        style: TextStyle(
          color: Colors.white,
          backgroundColor: Colors.blue,
        ),
      ),
  ),
),
```

### animated container

see [AllFeatures02](../projects/AllFeatures02)

```java
Container(
  margin: EdgeInsets.symmetric(vertical: 10.0),
  child: AnimatedContainer(
    height: sideLength,
    width: sideLength,
    duration: const Duration(seconds: 2),
    curve: Curves.easeIn,
    child: Material(
      color: Colors.yellow,
      child: InkWell(
        onTap: () {
          setState(() {
            sideLength == 50 ? sideLength = 100 : sideLength = 50;
          });
        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Animated Container', 
              style: TextStyle(fontSize:22),
            ),
          ),
        ),
      ),
    ),
  ),
),
```