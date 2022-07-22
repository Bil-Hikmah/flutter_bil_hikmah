import 'package:flutter_bil_hikmah/network/sn_token_provider.dart';

abstract class HeaderProvider {
  Future<Map<String, String>> get headers;
}

class AppHttpHeaderProvider implements HeaderProvider {
  final TokenProvider _tokenProvider;

  AppHttpHeaderProvider(
    this._tokenProvider,
  );

  @override
  Future<Map<String, String>> get headers async {
    try {
      final accessToken = await _tokenProvider.getAccessToken();
      final headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      };
      return headers;
    } catch (exception) {
      throw Exception(exception);
    }
  }

  factory AppHttpHeaderProvider.create() {
    final tokenProvider = SNTokenProvider.create();
    return AppHttpHeaderProvider(tokenProvider);
  }
}
