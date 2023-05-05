void main() {
  // for loop
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      continue;
    }
    if (i == 8) {
      break;
    }
    print(i);
  }

  int total = 0;
  List<int> nums = [1, 2, 3, 4, 5, 6];
  for (int i = 0; i < nums.length; i++) {
    total += nums[i];
  }
  print(total);

  int total2 = 0;
  for (int i in nums) {
    total2 += i;
  }
  print(total2);

  //while loop
  int j = 0;
  while (j < 10) {
    print(j++);
    if (j > 5) {
      break;
    }
  }
}
