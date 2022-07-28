import 'package:flutter_bil_hikmah/common/network/sn_token_provider.dart';

abstract class HeaderProvider {
  Future<Map<String, String>> get headers;
}

class AppHeaderProvider implements HeaderProvider {
  final TokenProvider _tokenProvider;

  AppHeaderProvider(
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

  factory AppHeaderProvider.create() {
    final tokenProvider = SNTokenProvider.create();
    return AppHeaderProvider(tokenProvider);
  }
}
