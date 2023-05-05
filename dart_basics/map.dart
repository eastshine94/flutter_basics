void main() {
  //map<key,value>
  Map<String, String> dictionary = {
    "Harry Porter": "해리포터",
    "Ron Weasley": "론 위즐리",
    "Hermione Granger": "헤르미온느 그레인저"
  };
  print(dictionary);

  Map<String, bool> isHarryPotter = {
    "Harry Porter": true,
    "Ron Weasley": true,
    "Ironman": false
  };

  print(isHarryPotter);

  isHarryPotter.addAll({"Spiderman": false});
  print(isHarryPotter);
  print(isHarryPotter['Ironman']);
  isHarryPotter['Hulk'] = false;
  print(isHarryPotter);
  isHarryPotter['Spiderman'] = true;
  print(isHarryPotter);

  isHarryPotter.remove("Ironman");

  print(isHarryPotter);

  print(isHarryPotter.keys);
  print(isHarryPotter.values);
}
