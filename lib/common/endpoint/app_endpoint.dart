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

  Uri getVideoGenre() {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: "/api/video-types",
    );
  }

  Uri getVideo(int? idTypeVideo) {
    return UriHelper.createUrl(
      host: _baseUrl,
      path: "/api/videos",
      queryParameters: {
        if (idTypeVideo != null) "id_category": idTypeVideo.toString(),
      },
    );
  }

  factory AppEndpoint.create() {
    return AppEndpoint(
      "bilhikmah-api.jogjadev.my.id",
      "bilhikmah-quran.vercel.app",
    );
  }
}
