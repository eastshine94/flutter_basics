void main() {
  final Set<String> names = {"Flutter", "React", "Next", "Next"};
  print(names);

  names.add("Vue");
  print(names);

  names.remove("Vue");
  print(names);

  print(names.contains("Flutter"));
}
