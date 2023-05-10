void main() {
  List<String> blackpink = ['로제', '리사', '제니', '지수', '지수'];

  print(blackpink);
  print(blackpink.asMap());
  print(blackpink.toSet());

  Map blackpinkMap = blackpink.asMap();
  print(blackpinkMap.keys.toList());
  print(blackpinkMap.values.toList());

  Set blackpinkSet = blackpink.toSet();
  print(blackpinkSet.toList());
}
