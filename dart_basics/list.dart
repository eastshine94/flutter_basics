void main() {
  List<String> regions = ["seoul", "daegu", "daejeon", "busan"];
  List<int> nums = [1, 2, 3, 4, 5];

  print(regions);
  print(nums);

  //index
  print(regions[0]);
  print(nums[2]);

  print(regions.length);

  regions.add("jeju");
  print(regions);

  regions.remove("jeju");
  print(regions);

  print(regions.indexOf("daegu"));
}
