void main() {
  List<int> numbers = [1, 3, 5, 7, 9];

  final result = numbers.reduce((prev, next) => prev + next);
  print(result);

  List<String> words = ['안녕하세여', "반갑습니다", '반가워요'];

  final sentence = words.reduce((prev, next) => prev + next);

  print(sentence);

  // reduce는 같은 타입을 return 해야한다.
  // words.reduce((prev, next) => prev.length + next.length); => 불가
  // 다른 타입을 return 하려면 fold 사용
}
