import 'package:flutter_bil_hikmah/common/endpoint/app_endpoint.dart';
import 'package:flutter_bil_hikmah/common/network/http_client.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/model/quran_item.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/model/surah_item.dart';
import 'package:flutter_exception/flutter_exception.dart';

import '../../../../common/misc/injection.dart';

abstract class QuranService {
  Future<QuranItem> quranAll();
  Future<SurahItem> surahDetail(int surah);
}

class QuranServiceImpl implements QuranService {
  final HttpClient _httpClient;
  final AppEndpoint _appEndpoint;

  QuranServiceImpl(this._httpClient, this._appEndpoint);

  @override
  Future<QuranItem> quranAll() async {
    try {
      final url = _appEndpoint.getQuranAll();
      final response = await _httpClient.get(
        url,
        null,
      );
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return QuranItem.fromJson(response.body);
    } on AppException {
      rethrow;
    }
  }

  @override
  Future<SurahItem> surahDetail(int surah) async {
    try {
      final url = _appEndpoint.getQuranSurah(surah);
      final response = await _httpClient.get(
        url,
        null,
      );
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return SurahItem.fromJson(response.body);
    } on AppException {
      rethrow;
    }
  }

  factory QuranServiceImpl.create() {
    return QuranServiceImpl(
      Injection.httpClient,
      Injection.endpoint,
    );
  }
}
