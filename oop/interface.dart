void main() {
  BoyGroup bts = BoyGroup("BTS");
  GirlGroup redVelvet = GirlGroup("Red Velvet");

  bts.sayName();
  redVelvet.sayName();

  print("=========== Type Comparison ===========");
  print('IdolInterface: ${bts is IdolInterface}');
  print('BoyGroup: ${bts is BoyGroup}');
  print('GirlGroup: ${bts is GirlGroup}');

  print("=========== Type Comparison2 ===========");
  print('IdolInterface: ${redVelvet is IdolInterface}');
  print('BoyGroup: ${redVelvet is BoyGroup}');
  print('GirlGroup: ${redVelvet is GirlGroup}');
}

// interface
// 특수한 구조를 강제
// abstract를 쓰면 인스턴스로 만들 수 없게 됨 => IdolInterface test = IdolInterface("test") 불가

abstract class IdolInterface {
  String name;

  IdolInterface(this.name);

  void sayName();
}

class BoyGroup implements IdolInterface {
  String name;

  BoyGroup(this.name);

  void sayName() {
    print('제 이름은 $name입니다.');
  }
}

class GirlGroup implements IdolInterface {
  String name;

  GirlGroup(this.name);

  void sayName() {
    print('제 이름은 $name입니다.');
  }
}
