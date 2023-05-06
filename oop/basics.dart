void main() {
  Idol blackpink = const Idol('블랙핑크', ['지수', '제니', '리사', '로제']);
  Idol blackpink2 = const Idol('블랙핑크', ['지수', '제니', '리사', '로제']);
  Idol blackpink3 = Idol('블랙핑크', ['지수', '제니', '리사', '로제']);

  print(blackpink.name);
  print(blackpink.members);
  blackpink.sayHello();
  blackpink.introduce();

  print("=========================================");
  // const로 선언하면 값이 같을 경우, 같은 인스턴스로 인식
  print(blackpink == blackpink2);
  print(blackpink == blackpink3);

  print("=========================================");
  Idol bts = Idol.fromList([
    ['RM', '진', '슈가', '제이홉', '지민', '정국', '뷔'],
    'BTS'
  ]);
  print(bts.name);
  print(bts.members);
  bts.sayHello();
  bts.introduce();
}

/**
 * Idol Class
 * name(이름) - 변수
 * members(멤버들) - 변수
 * sayHello (인사) - 함수
 * introduce (멤버 소개) - 함수
 * 
 */

class Idol {
  // immutable 프로그래밍 => 처음 선언된 값을 바꿀 수 없도록
  final String name;
  final List<String> members;

  //constructor(생성자)
  // Idol(String name, List<String> members)
  //     : this.name = name,
  //       this.members = members;
  const Idol(this.name, this.members);
  Idol.fromList(List values)
      : this.members = values[0],
        this.name = values[1];

  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }

  void introduce() {
    print('저희 멤버는 ${this.members.join(", ")}가 있습니다.');
  }
}
