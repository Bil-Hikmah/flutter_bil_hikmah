import 'package:api_exception/api_exception.dart';
import 'package:flutter_bil_hikmah/common/endpoint/app_endpoint.dart';
import 'package:flutter_bil_hikmah/common/misc/injection.dart';
import 'package:flutter_bil_hikmah/common/network/header_provider.dart';
import 'package:flutter_bil_hikmah/common/network/http_client.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/model/adhan_schedule.dart';
import 'package:intl/intl.dart';

abstract class HomeService {
  Future<bool> getHomeData();
  Future<AdhanSchedule> getAdhanSchedule();
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

  @override
  Future<AdhanSchedule> getAdhanSchedule() async {
    try {
      final years = DateTime.now().year;
      final months = DateFormat("MM").format(DateTime.now());
      final uri = Uri.parse(
          "https://cdn.statically.io/gh/lakuapik/jadwalsholatorg/master/adzan/yogyakarta/$years/$months.json");
      final response = await _httpClient.get(
        uri,
        null,
      );
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return AdhanSchedule.fromJson(response.body);
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
