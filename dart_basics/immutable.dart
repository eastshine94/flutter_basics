void main() {
  // final, const는 값을 변경할 수 없음
  final f1 = "final"; // f1 = "변경"  => 불가
  const f2 = "const"; // f2 = "변경"  => 불가

  /**
  * final은 build time의 값을 몰라도 됨
  * const는 build time때의 값을 알아야 됨
  */
  final DateTime now = DateTime.now();
  // const DateTime now2 = DateTime.now(); => 불가
}
