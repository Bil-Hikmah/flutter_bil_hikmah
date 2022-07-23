import "package:http/http.dart" as http;

abstract class HttpClient<T> {
  Future<T> get(Uri url, Map<String, String>? headers);
  Future<T> post(Uri url, Map<String, String>? headers, Object? body);
  Future<T> put(Uri url, Map<String, String>? headers, Object? body);
  Future<T> delete(Uri url, Map<String, String>? headers, Object? body);
}

class AppHttpClient implements HttpClient {
  final http.Client _client;

  AppHttpClient(this._client);

  @override
  Future<http.Response> delete(
      Uri url, Map<String, String>? headers, Object? body) async {
    try {
      final response = await _client.delete(url, headers: headers, body: body);
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> get(Uri url, Map<String, String>? headers) async {
    try {
      final response = await _client.get(url, headers: headers);
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> post(
      Uri url, Map<String, String>? headers, Object? body) async {
    try {
      final response = await _client.post(url, headers: headers, body: body);
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<http.Response> put(
      Uri url, Map<String, String>? headers, Object? body) async {
    try {
      final response = await _client.put(url, headers: headers, body: body);
      return response;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  factory AppHttpClient.create() {
    final client = http.Client();
    return AppHttpClient(client);
  }
}
