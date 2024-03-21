class ApiUrls {
  static String trending({required String apiKey}) =>
      "trending?api_key=${apiKey}";
  static String search({required String apiKey, required String query}) => "sea"
      "rch"
      "?api_key=${apiKey}&q=${query}";
}
