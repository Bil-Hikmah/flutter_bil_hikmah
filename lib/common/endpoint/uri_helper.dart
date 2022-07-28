class UriHelper {
  static Uri createUrl({
    required String host,
    String? path,
    Map<String, dynamic>? queryParameters,
  }) =>
      Uri(
        scheme: "https",
        host: host,
        path: path,
        queryParameters: queryParameters,
      );
}
