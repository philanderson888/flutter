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

or all images

```yaml
flutter:
  uses-material-design: true
  assets:
    - images/
```

here is an example using both network and asset images

```java
Image(
  image: NetworkImage(
      'https://www.planete-energies.com/sites/default/files/styles/media_full_width_940px/public/thumbnails/image/452001095-lignite.jpg'),
  width: 400,
  height: 400,
),
Image(
  image: AssetImage('images/coal.jpg'),
  width: 200,
  height: 200,
)
```

run this command

```java
flutter packages get
```

## flutter app icon

we can change the icon for our app from the default icon to one of our choosing

download our icon image and if it's too big go to https://appicon.co and upload our image to this website, which will turn our image into an icon image for us!


