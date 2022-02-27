# responsive layout builder

## contents

- [responsive layout builder](#responsive-layout-builder)
  - [contents](#contents)
  - [intro](#intro)

## intro

responsive layout builder can be used to display components at certain widths, depending on the screen resolution.  so for small devices, certain components can be removed for example

```java
import 'package:flutter/material.dart';
import 'package:flutter_layout_builder_demo/themes/device_size.dart';
class LayoutBuilderDemo extends StatefulWidget {
  @override
  _LayoutBuilderDemoState createState() => _LayoutBuilderDemoState();
}

class _LayoutBuilderDemoState extends State<LayoutBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('LayoutBuilder Demo'),
          centerTitle: true,
        ),
        body: Container(
          height: DeviceSize.height(context),
          width: DeviceSize.width(context),
          alignment: Alignment.center,
          child: LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
              if (constraints.maxWidth >= 480) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding:EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: constraints.maxHeight * 0.3,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0,10.0,0.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        'Left Wide Screen',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: constraints.maxHeight * 0.3,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0,10.0,0.0),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        'Right Wide Screen',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );

                // If screen size is < 480
              } else {
                return Container(
                  alignment: Alignment.center,
                  height: constraints.maxHeight * 0.3,
                  margin: EdgeInsets.fromLTRB(10.0, 0.0,10.0,0.0),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Text(
                    'Normal Screen',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
```