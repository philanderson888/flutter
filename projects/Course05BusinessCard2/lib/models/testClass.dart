class TestClass {
  int? a = 0;
  String b = "";
  bool c = false;
  var _privateProperty = 0.0;
  TestClass({
    required int a,
    required String b,
    required bool c,
    double privateProperty = 0.0,
  }) {
    this.a = a;
    this.b = b;
    this.c = c;
    this._privateProperty = privateProperty;
  }
}

// illustration with ordered parameters only - not best practice
class TestAlsoClass {
  double height;
  String length;
  TestAlsoClass(this.height, this.length);
}
