void main() {
  List<Map<String, String>> people = [
    {"name": "로제", "그룹": "블랙핑크"},
    {"name": "지수", "그룹": "블랙핑크"},
    {"name": "RM", "그룹": "BTS"},
    {"name": "뷔", "그룹": "BTS"}
  ];

  print(people);
  final blackpink = people.where((x) => x['그룹'] == '블랙핑크');
  final bts = people.where((x) => x['그룹'] == 'BTS');

  print(blackpink);
  print(bts);
}
