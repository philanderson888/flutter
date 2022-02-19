# animation


## contents

- [animation](#animation)
  - [contents](#contents)
  - [intro](#intro)
    - [animated container](#animated-container)

## intro

this shows different animations

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