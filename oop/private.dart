void main() {
  _Idol blackpink = _Idol('블랙핑크', ['지수', '제니', '리사', '로제']);

  _Idol bts = _Idol.fromList([
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

// _을 앞에 붙이면 private
// private을 하게 되면 이 파일에서만 해당 객체를 불러올 수 있음
class _Idol {
  String _name;
  List<String> _members;

  _Idol(this._name, this._members);
  _Idol.fromList(List values)
      : this._members = values[0],
        this._name = values[1];

  void sayHello() {
    print('안녕하세요 ${this._name}입니다.');
  }

  void introduce() {
    print('저희 멤버는 ${this._members.join(", ")}가 있습니다.');
  }

  // getter
  String get firstMember {
    return this._members[0];
  }

  // setter
  // immutable 하게 만들기 때문에 현대에서는 잘 사용하지 않음..
  set firstMember(String name) {
    this._members[0] = name;
  }
}
