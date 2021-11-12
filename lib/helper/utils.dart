class Utils{
  static List<T> parseJsonToList<T>(
      String key,
      Map<String, dynamic>? json,
      T Function(Map<String, dynamic>) factoryFunction,
      ) {
    if (json == null) return <T>[];
    final list = parseJson<List>(key, json) ?? <T>[];
    return listFromJson(list, factoryFunction);
  }

  static T? parseJson<T>(String key, Map<String, dynamic>? json, {T? defaultValue}) {
    if (json == null) return defaultValue;
    try {
      return json.containsKey(key) && json[key] is T ? json[key] : defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  static List<T> listFromJson<T>(List json, T Function(Map<String, dynamic>) factoryFunction) {
    final list = <T>[];
    json.forEach((element) {
      if (element is Map<String, dynamic>) {
        final value = factoryFunction(element);
        list.add(value);
      }
    });
    return list;
  }
}