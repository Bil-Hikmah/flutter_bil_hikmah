import 'auth_credential_storage_service.dart';

abstract class TokenProvider {
  Future<String> getAccessToken();
}

class _LocalTokenProvider implements TokenProvider {
  final AuthCredentialStorageService _localStorageService;

  _LocalTokenProvider(this._localStorageService);

  @override
  Future<String> getAccessToken() async {
    final authCredential = await _localStorageService.read();
    return authCredential.accessToken;
  }
}

class SNTokenProvider {
  static TokenProvider create() {
    return _LocalTokenProvider(
      AuthCredentialLocalStorageService.create(),
    );
  }
}
