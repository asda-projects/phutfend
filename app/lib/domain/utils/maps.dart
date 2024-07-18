String getValue(Map fromMap, String getFromKey) {
  if (fromMap.containsKey(getFromKey)) return fromMap[getFromKey];
  return 'unknown';
}
