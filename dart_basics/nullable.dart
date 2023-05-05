void main() {
  // nullable => ?를 쓰면 null을 넣을 수 있음
  String? na = null;
  na = "값이 있음";
  print(na);
  // !를 쓰면 non-nullable이라는 의미
  print(na);
}
