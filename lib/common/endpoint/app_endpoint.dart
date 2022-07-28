import 'package:flutter_bil_hikmah/common/endpoint/uri_helper.dart';

class AppEndpoint {
  final String _baseUrl;

  AppEndpoint(this._baseUrl);

  Uri getHomePage() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: "/api/v1/home",
    );
  }

  factory AppEndpoint.create() {
    return AppEndpoint("https://api.example.com");
  }
}
