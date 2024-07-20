Map removeFromMap(Map originalMap, List<String> itemsToremove) {

  Map<String, dynamic> modifiedMap = Map<String, dynamic>.from(originalMap);

  for (String key in itemsToremove) {
    modifiedMap.remove(key);
  }

  return modifiedMap;

}