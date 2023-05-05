void main() {
  int num = 2;
  if (num % 2 == 0) {
    print('${num}은 짝수 입니다.');
  } else {
    print('${num}은 홀수 입니다.');
  }

  int num2 = 3;
  if (num2 % 3 == 0) {
    print('나머지는 0입니다.');
  } else if (num2 % 3 == 1) {
    print('나머지는 1입니다.');
  } else {
    print('나머지는 2입니다.');
  }

  int num3 = 3;
  switch (num3 % 3) {
    case 0:
      print('나머지는 0입니다.');
      break;
    case 1:
      print('나머지는 1입니다.');
      break;
    default:
      print('나머지는 2입니다.');
      break;
  }
}
