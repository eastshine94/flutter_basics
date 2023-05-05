void main() {
  // var는 자동으로 타입 유추
  // var는 재선언 시, type을 바꿀 수 없음
  var vari = "홍길동";
  //vari = 2; => 불가
  print("Hello " + vari);

  // dynamic은 재선언 시, type을 바꿀 수 없음
  dynamic dy = "다이나믹";
  //dy = 2; => 가능
  print(dy);
}
