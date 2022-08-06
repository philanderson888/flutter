class MixinParent {
  parentBehaviour() {
    print('parent is doing this');
  }
}

class MixinChild01 extends MixinParent {
  @override
  parentBehaviour() {
    print(' ');
    super.parentBehaviour();
    print('mixinChild01 also has some extra unique behaviour');
  }
}

class MixinChild02 extends MixinParent {
  @override
  parentBehaviour() {
    print(' ');
    super.parentBehaviour();
    print('mixinChild02 also has some extra unique behaviour');
  }
}

class MixinChild03 extends MixinParent with InjectCode01, InjectCode02 {
  @override
  parentBehaviour() {
    print(' ');
    super.parentBehaviour();
    print('mixinChild03 also has some extra unique behaviour');
  }
}

mixin InjectCode01 {
  uniqueBehaviour01() {
    print('doing some pretty unique stuff');
  }
}

mixin InjectCode02 {
  uniqueBehaviour02() {
    print('doing some more pretty unique stuff');
  }
}
