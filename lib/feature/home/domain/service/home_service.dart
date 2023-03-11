import 'dart:developer';

import 'package:api_exception/api_exception.dart';
import 'package:flutter_bil_hikmah/common/endpoint/app_endpoint.dart';
import 'package:flutter_bil_hikmah/common/misc/injection.dart';
import 'package:flutter_bil_hikmah/common/network/firebase_service.dart';
import 'package:flutter_bil_hikmah/common/network/header_provider.dart';
import 'package:flutter_bil_hikmah/common/network/http_client.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/model/adhan_schedule.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';
import 'package:intl/intl.dart';

abstract class HomeService {
  Future<bool> getHomeData();
  Future<AdhanSchedule> getAdhanSchedule();
  Future<List<VideoDakwahModels>> onGetVideoDakwah();
}

class HomeServiceImpl implements HomeService {
  HttpClient _httpClient;
  HeaderProvider _headerProvider;
  AppEndpoint _appEndpoint;
  FirebaseService _service;

  HomeServiceImpl(
    this._httpClient,
    this._headerProvider,
    this._appEndpoint,
    this._service,
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

  @override
  Future<List<VideoDakwahModels>> onGetVideoDakwah() async {
    try {
      final response = await _service.getLimitDocument(3);
      log(response.toString());
      return response!
          .map((e) => VideoDakwahModels.fromJson(e.data()))
          .toList();
    } catch (e) {
      throw UnknownException(message: e.toString());
    }
  }

  factory HomeServiceImpl.create() {
    return HomeServiceImpl(
      Injection.httpClient,
      Injection.headerProvider,
      Injection.endpoint,
      FirebaseServiceImplementation.create("video_dakwah"),
    );
  }
}
