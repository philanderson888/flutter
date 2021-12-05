# oop

## contents

- [oop](#oop)
  - [contents](#contents)
  - [introduction](#introduction)
  - [class](#class)
  - [constructor](#constructor)


## introduction

it's very useful to be able to use OOP and flutter is no different

## class

```java
class Post {
  int id;
  String title, body, userId;
}
```

## constructor

```java
class Post {
  int id;
  String title, body, userId;

  // default constructor
  Post()
      : id = 0,
        title = '',
        body = '',
        userId = '';

  // constructor with values
  Post.overloadedConstructor(this.id, this.title, this.body, this.userId);

}
```