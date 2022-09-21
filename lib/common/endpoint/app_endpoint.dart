import 'package:flutter_bil_hikmah/common/endpoint/uri_helper.dart';

class AppEndpoint {
  final String _baseUrl;
  final String _baseQuranUrl;

  AppEndpoint(
    this._baseUrl,
    this._baseQuranUrl,
  );

  Uri getHomePage() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: "/api/v1/home",
    );
  }

  Uri getQuranAll() {
    return UriHelper.createUrl(
      host: _baseQuranUrl,
      path: "/surah",
    );
  }

  Uri getQuranSurah(int surah) {
    return UriHelper.createUrl(
      host: _baseQuranUrl,
      path: "/surah/$surah",
    );
  }

  Uri getQuranSurahAyat(int surah, int ayat) {
    return UriHelper.createUrl(
      host: _baseQuranUrl,
      path: "/surah/$surah/$ayat",
    );
  }

  Uri getQuranJuz(int juz) {
    return UriHelper.createUrl(
      host: _baseQuranUrl,
      path: "/juz/$juz",
    );
  }

  factory AppEndpoint.create() {
    return AppEndpoint(
      "https://api.example.com",
      "bilhikmah-quran.vercel.app",
    );
  }
}
