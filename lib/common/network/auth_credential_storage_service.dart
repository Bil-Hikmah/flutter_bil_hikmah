import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthCredential {
  final String accessToken;
  final String refreshToken;

  const AuthCredential(
    this.accessToken,
    this.refreshToken,
  );
}

abstract class AuthCredentialStorageService {
  Future<void> save(AuthCredential credential);
  Future<AuthCredential> read();
  Future<void> clear();
}

class _AuthCredentialLocalStorageService
    implements AuthCredentialStorageService {
  static const String _accessTokenKey = "accessToken";
  static const String _refreshTokenKey = "refreshToken";

  final FlutterSecureStorage _secureStorage;

  _AuthCredentialLocalStorageService(this._secureStorage);

  @override
  Future<AuthCredential> read() async {
    final accessToken = await _secureStorage.read(key: _accessTokenKey);
    final refreshToken = await _secureStorage.read(key: _refreshTokenKey);
    if (accessToken != null && refreshToken != null) {
      return AuthCredential(accessToken, refreshToken);
    } else {
      throw Exception(
          "Could not get required data for authentication credential");
    }
  }

  @override
  Future<void> save(AuthCredential credential) async {
    try {
      await _secureStorage.write(
          key: _accessTokenKey, value: credential.accessToken);
      await _secureStorage.write(
          key: _refreshTokenKey, value: credential.refreshToken);
    } catch (exception) {
      throw Exception(exception);
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _secureStorage.delete(key: _accessTokenKey);
      await _secureStorage.delete(key: _refreshTokenKey);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class AuthCredentialLocalStorageService {
  static AuthCredentialStorageService create() {
    return _AuthCredentialLocalStorageService(
      const FlutterSecureStorage(),
    );
  }
}
