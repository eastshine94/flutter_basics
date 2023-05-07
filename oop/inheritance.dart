void main() {
  print("=========== Idol ===========");
  Idol apink = Idol(name: '에이핑크', membersCount: 5);

  apink.sayName();
  apink.sayMemberCount();

  print("=========== Boy Group ===========");
  BoyGroup bts = BoyGroup("BTS", 7);
  bts.sayName();
  bts.sayMemberCount();
  bts.sayMale();

  print("=========== Girl Group ===========");
  GirlGroup redVelvet = GirlGroup("Red Velvet", 5);
  redVelvet.sayName();
  redVelvet.sayMemberCount();
  redVelvet.sayFemale();

  print("=========== Type Comparison ===========");
  print('Idol: ${apink is Idol}');
  print('BoyGroup: ${apink is BoyGroup}');
  print('GirlGroup: ${apink is GirlGroup}');

  print("=========== Type Comparison2 ===========");
  print('Idol: ${bts is Idol}');
  print('BoyGroup: ${bts is BoyGroup}');
  print('GirlGroup: ${bts is GirlGroup}');

  print("=========== Type Comparison3===========");
  print('Idol: ${redVelvet is Idol}');
  print('BoyGroup: ${redVelvet is BoyGroup}');
  print('GirlGroup: ${redVelvet is GirlGroup}');
}

// 상속 - inheritance
// 상속을 받으면 부모 클래스의 모든 속성을 자식 클래스가 부여 받는다
// 자식 클래스의 속성은 부모 클래스로 넘어가지 않는다.
// 자식 클래스 간에도 속성이 공유되지 않는다.
class Idol {
  String name;
  int membersCount;

  Idol({required this.name, required this.membersCount});

  void sayName() {
    print('저는 ${this.name}입니다.');
  }

  void sayMemberCount() {
    print('${this.name}은 ${this.membersCount}명의 멤버가 있습니다.');
  }
}

class BoyGroup extends Idol {
  BoyGroup(String name, int membersCount)
      : super(name: name, membersCount: membersCount);

  void sayMale() {
    print("저희는 남자 아이돌입니다.");
  }
}

class GirlGroup extends Idol {
  GirlGroup(String name, int membersCount)
      : super(name: name, membersCount: membersCount);

  void sayFemale() {
    print("저희는 여자 아이돌입니다.");
  }
}
