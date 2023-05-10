void main() {
  List<String> blackpink = ['로제', '리사', '제니', '지수'];
  final newBlackpink = blackpink.map((val) {
    return "블랙핑크 $val";
  });
  print(blackpink);
  print(newBlackpink.toList());

  final newBlackpink2 = blackpink.map((val) => "블랙핑크 $val");
  print(newBlackpink2.toList());

  print(blackpink == blackpink);
  print(blackpink == newBlackpink);
  print(newBlackpink == newBlackpink2);

  String number = '13579';
  final parsed = number.split('').map((x) => '$x.jpg').toList();
  print(parsed);

  Map<String, String> harryPotter = {
    "Harry Porter": "해리포터",
    "Ron Weasley": "론 위즐리",
    "Hermione Granger": "헤르미온느 그레인저"
  };

  final result = harryPotter.map((key, value) =>
      MapEntry("Harry Porter Character $key", "해리포터 캐릭터 $value"));

  print(harryPotter);
  print(result);

  final keys = harryPotter.keys.map((x) => "HPC $x").toList();
  final values = harryPotter.values.map((x) => "해리포터 $x").toList();

  print(keys);
  print(values);

  Set blackpinkSet = {'로제', '리사', '제니', '지수'};
  final newSet = blackpinkSet.map((x) => '블랙핑크 $x').toSet();
  print(newSet);
}
