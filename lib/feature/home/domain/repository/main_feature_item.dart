import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';

class MainFeatureItem {
  String url;
  String title;
  int index;
  MainFeatureItem(
    this.url,
    this.title,
    this.index,
  );
}

final List<MainFeatureItem> listMainFeature = [
  MainFeatureItem(UrlAsset.videokKajian, "Video Kajian", 0),
  MainFeatureItem(UrlAsset.quranSaku, "Qur'an Saku", 1),
  MainFeatureItem(UrlAsset.gameEdukasi, "Game Edukasi", 2),
  MainFeatureItem(UrlAsset.dakwahDifabel, "Dakwah Difabel", 3),
  MainFeatureItem(UrlAsset.akhlakMulia, "Qur'an Saku\n Disabilitas", 4),
  MainFeatureItem(UrlAsset.amalanSunnah, "Amalan Sunnah", 5),
  MainFeatureItem(UrlAsset.bahasaIsyarat, "Bahasa Isyarat", 6),
  MainFeatureItem(UrlAsset.posterDakwah, "Poster Dakwah", 7),
];
