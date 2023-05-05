void main() {
  int num = 4;
  print(num + 2);
  print(num - 2);
  print(num * 2);
  print(num / 2);

  // 나머지
  print(num % 2);
  print(num % 3);

  num++;
  print(num);

  num--;
  print(num);

  //=============================
  double num2 = 4.0;
  num2 += 1;
  print(num2);

  num2 -= 1;
  print(num2);

  num2 *= 2;
  print(num2);

  num2 /= 2;
  print(num2);

  //=============================

  double? num3 = 4.0;
  print(num3);

  // ??는 num3의 값이 null이면 값을 바꿈
  num3 ??= 8.0;
  print(num3);

  num3 = null;
  print(num3);

  num3 ??= 8.0;
  print(num3);

  // 비교 연산자
  int num4 = 1;
  int num5 = 4;
  print(num4 > num5);
  print(num4 < num5);
  print(num4 >= num5);
  print(num4 <= num5);
  print(num4 == num5);
  print(num4 != num5);

  print(num4 is int);
  print(num4 is String);

  print(num4 is! int);
  print(num4 is! String);

  // 논리 연산자
  // && - and 조건
  // || - or 조건
  bool result = 12 > 10 && 1 > 0;
  print(result);

  bool result2 = 12 < 10 && 1 > 0;
  print(result2);

  bool result3 = 12 < 10 || 1 > 0;
  print(result3);

  bool result4 = 12 < 10 || 1 < 0;
  print(result4);
}
