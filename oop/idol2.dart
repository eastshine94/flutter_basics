void main() {
  Idol blackpink = Idol('블랙핑크', ['지수', '제니', '리사', '로제']);

  Idol bts = Idol.fromList([
    ['RM', '진', '슈가', '제이홉', '지민', '정국', '뷔'],
    'BTS'
  ]);

  print(blackpink.firstMember);
  print(bts.firstMember);

  blackpink.firstMember = "원더우먼";
  bts.firstMember = '아이언맨';

  print(blackpink.firstMember);
  print(bts.firstMember);
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
  String name;
  List<String> members;

  //constructor(생성자)
  // Idol(String name, List<String> members)
  //     : this.name = name,
  //       this.members = members;
  Idol(this.name, this.members);
  Idol.fromList(List values)
      : this.members = values[0],
        this.name = values[1];

  void sayHello() {
    print('안녕하세요 ${this.name}입니다.');
  }

  void introduce() {
    print('저희 멤버는 ${this.members.join(", ")}가 있습니다.');
  }

  // getter
  String get firstMember {
    return this.members[0];
  }

  // setter
  // immutable 하게 만들기 때문에 현대에서는 잘 사용하지 않음..
  set firstMember(String name) {
    this.members[0] = name;
  }
}
