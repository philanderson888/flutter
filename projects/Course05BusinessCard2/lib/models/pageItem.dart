import 'dart:ui';
import 'package:flutter/material.dart';

doNothing() {}

// Page Item
class PageItem {
  dynamic functionName = doNothing;
  String buttonText = "";
  Color buttonColor = Colors.transparent;
  // special constructor forces named parameters to be passed
  PageItem({
    this.functionName,
    this.buttonText = "",
    this.buttonColor = const Color(0xFF417EFF),
  }) {
    // ensure parameters are not null
    assert(functionName != "", "A function name is required");
    assert(buttonText != "", "Button Text is required");
  }
}
