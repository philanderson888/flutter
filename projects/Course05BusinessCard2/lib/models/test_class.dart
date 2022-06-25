class TestClass {
  int? a = 0;
  String b = "";
  bool c = false;
  final _privateProperty = 5.0;
  TestClass({
    required int a,
    required String b,
    required bool c,
    double privateProperty = 0.0,
  }) {
    a = a;
    b = b;
    c = c;
    privateProperty = _privateProperty;
  }
}

// illustration with ordered parameters only - not best practice
class TestAlsoClass {
  double height;
  String length;
  TestAlsoClass(this.height, this.length);
}
