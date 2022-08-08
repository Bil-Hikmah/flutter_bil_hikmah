import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';

class MainFeatureItem {
  String url;
  String title;
  MainFeatureItem(this.url, this.title);
}

final List<MainFeatureItem> listMainFeature = [
  MainFeatureItem(UrlAsset.videokKajian, "Video Kajian"),
  MainFeatureItem(UrlAsset.quranSaku, "Qur'an Saku"),
  MainFeatureItem(UrlAsset.gameEdukasi, "Game Edukasi"),
  MainFeatureItem(UrlAsset.dakwahDifabel, "Dakwah Difabel"),
  MainFeatureItem(UrlAsset.akhlakMulia, "Akhlak Mulia"),
  MainFeatureItem(UrlAsset.amalanSunnah, "Amalan Sunnah"),
  MainFeatureItem(UrlAsset.bahasaIsyarat, "Bahasa Isyarat"),
  MainFeatureItem(UrlAsset.posterDakwah, "Poster Dakwah"),
];
