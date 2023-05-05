void main() {
  Operation op = add;
  int result = op(10, 20, 30);
  print(result);
  op = sub;
  int result2 = op(10, 20, 30);
  print(result2);

  print(cal(10, 20, 30, add));
  print(cal(10, 20, 30, sub));
}

typedef Operation = int Function(int x, int y, int z);

// 더하기
int add(int x, int y, int z) => x + y + z;

// 빼기
int sub(int x, int y, int z) => x - y - z;

int cal(int x, int y, int z, Operation operation) {
  return operation(x, y, z);
}
