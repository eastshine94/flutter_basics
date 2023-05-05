void main() {
  print(addNumbers(1, 2, 3));
  print(addNumbers(10));
  print("=====================================");
  print(addNumbers2(x: 1, y: 2, z: 3));
  print(addNumbers2(x: 10));
  print("=====================================");
  print(addNumbers3(1, y: 2, z: 3));
  print(addNumbers3(10, y: 20));
  print("=====================================");
  print(addNumbers4(10, 20, 30));
}

// 세 개의 숫자 (x, y, z)를 더하고 짝수인지 홀수인지 알려주는 함수
// parameter / argument - 매개변수
// positional parameter - 순서가 중요한 파라미터
// optional parameter - 있어도 되고, 없어도 되는 파라미터
int addNumbers(int x, [int y = 20, int z = 30]) {
  print('x: $x');
  print('y: $y');
  print('z: $z');
  int sum = x + y + z;

  if (sum % 2 == 0) {
    print("짝수 입니다.");
  } else {
    print("홀수 입니다.");
  }

  return sum;
}

// named parameter - 이름이 있는 파라미터 (순서가 중요하지 않음)
// optional parameter - 있어도 되고, 없어도 되는 파라미터

int addNumbers2({required int x, int y: 20, int z: 30}) {
  print('x: $x');
  print('y: $y');
  print('z: $z');
  int sum = x + y + z;

  if (sum % 2 == 0) {
    print("짝수 입니다.");
  } else {
    print("홀수 입니다.");
  }

  return sum;
}

int addNumbers3(int x, {required int y, int z: 30}) {
  print('x: $x');
  print('y: $y');
  print('z: $z');
  int sum = x + y + z;

  if (sum % 2 == 0) {
    print("짝수 입니다.");
  } else {
    print("홀수 입니다.");
  }

  return sum;
}

int addNumbers4(int x, [int y = 20, int z = 30]) => x + y + z;
