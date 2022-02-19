# images

## network images

```java
Image(
  image: NetworkImage(
      'https://www.w3schools.com/w3css/img_lights.jpg'),
),
```

## local images

put the image into /images/ directory (create it)

add image to `pubspec.yaml` file as an asset

```yaml
flutter:
  uses-material-design: true
  assets:
    - images/diamond.png
```

run this command

```java
flutter packages get
```



