import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';

class OnboardItem {
  String image;
  String title;
  String description;

  OnboardItem(
    this.image,
    this.title,
    this.description,
  );
}

final List<OnboardItem> dummyOnboard = [
  OnboardItem(
    UrlAsset.onBoardingImage[0],
    'BilHikmah',
    'BilHikmah adalah aplikasi untuk mengetahui keberadaan hikmah di sekitar anda.',
  ),
  OnboardItem(
    UrlAsset.onBoardingImage[1],
    'BilHikmah',
    'BilHikmah adalah aplikasi untuk mengetahui keberadaan hikmah di sekitar anda.',
  ),
  OnboardItem(
    UrlAsset.onBoardingImage[2],
    'BilHikmah',
    'BilHikmah adalah aplikasi untuk mengetahui keberadaan hikmah di sekitar anda.',
  ),
];
