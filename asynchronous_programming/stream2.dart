void main() {
  calculate(2).listen((val) {
    print("calculate(2): $val");
  });

  calculate(4).listen((val) {
    print("calculate(4): $val");
  });

  playAllStream().listen((val) {
    print(val);
  });
}

Stream<int> playAllStream() async* {
  // yield*은 await와 비슷
  yield* calculate(1);
  yield* calculate(1000);
}

Stream<int> calculate(int number) async* {
  for (int i = 0; i < 5; i++) {
    yield i + number;

    await Future.delayed(Duration(seconds: 1), () {
      print("delayed: $number");
    });
  }
}
