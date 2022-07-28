import 'package:flutter_bil_hikmah/common/endpoint/app_endpoint.dart';
import 'package:flutter_bil_hikmah/common/network/header_provider.dart';
import 'package:flutter_bil_hikmah/common/network/http_client.dart';

class Injection {
  static final httpClient = AppHttpClient.create();
  static final headerProvider = AppHeaderProvider.create();
  static final endpoint = AppEndpoint.create();
}
