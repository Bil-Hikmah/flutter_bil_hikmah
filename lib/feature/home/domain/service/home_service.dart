import 'package:flutter_bil_hikmah/common/endpoint/app_endpoint.dart';
import 'package:flutter_bil_hikmah/common/misc/injection.dart';
import 'package:flutter_bil_hikmah/common/network/header_provider.dart';
import 'package:flutter_bil_hikmah/common/network/http_client.dart';
import 'package:flutter_exception/exception.dart';
import 'package:flutter_exception/exception_handling.dart';

abstract class HomeService {
  Future<bool> getHomeData();
}

class HomeServiceImpl implements HomeService {
  HttpClient _httpClient;
  HeaderProvider _headerProvider;
  AppEndpoint _appEndpoint;

  HomeServiceImpl(
    this._httpClient,
    this._headerProvider,
    this._appEndpoint,
  );

  @override
  Future<bool> getHomeData() async {
    try {
      final uri = _appEndpoint.getHomePage();
      final headers = await _headerProvider.headers;
      final response = await _httpClient.get(
        uri,
        headers,
      );
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return true;
    } on AppException {
      rethrow;
    }
  }

  factory HomeServiceImpl.create() {
    return HomeServiceImpl(
      Injection.httpClient,
      Injection.headerProvider,
      Injection.endpoint,
    );
  }
}
