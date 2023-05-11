void main() async {
  // Future - 미래
  // 미래에 받아올 값
  Future<String> name = Future.value('코드팩토리');
  Future<int> number = Future.value(1);
  Future<bool> isTrue = Future.value(true);

  // 2개의 파라미터
  // delayed - 지연되다.
  // 1번 파라미터 - 지연할 시간 Duration
  // 2번 파라미터 - 지연 시간이 지난 후 실행할 함수
  Future.delayed(Duration(seconds: 2), () {
    print("delay 끝");
  });

  final result1 = await addNumbers(1, 1);
  final result2 = await addNumbers(2, 2);

  print('result1: $result1');
  print('result2: $result2');
  print('result1 + result2: ${result1 + result2}');
}

Future<int> addNumbers(int num1, int num2) async {
  print('계산 시작 : $num1 + $num2');

  await Future.delayed(Duration(seconds: 2), () {
    print('계산 완료: $num1 + $num2 = ${num1 + num2}');
  });
  print('함수 완료 : $num1 + $num2');

  return num1 + num2;
}
