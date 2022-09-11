import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/akhlak_mulia/screen/akhlak_mulia_page.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/screen/amalan_sunnah_page.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/repository/main_feature_item.dart';
import 'package:flutter_bil_hikmah/feature/home/screen/section/banner_home.dart';
import 'package:flutter_bil_hikmah/feature/home/screen/section/recommended_item.dart';
import 'package:flutter_bil_hikmah/feature/home/screen/section/upper_home.dart';
import 'package:flutter_bil_hikmah/feature/poster/screen/poster_page.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    const _upperHomeDescription = UpperHome();
    const _banner = BannerHome();

    List<Function()> _onPressed = [
      () => null,
      () => null,
      () => null,
      () => null,
      () => Navigator.of(context).push(AkhlakMuliaPage.route()),
      () => Navigator.of(context).push(AmalanSunnah.route()),
      () => null,
      () => Navigator.of(context).push(PosterPage.route()),
    ];

    Widget mainItemContainer(
      String imageUrl,
      String title,
      int index,
    ) {
      return InkWell(
        onTap: _onPressed[index],
        child: SizedBox(
          width: 50.0,
          child: Column(
            children: [
              Container(
                height: 42.0,
                width: 42.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.primaryDark,
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                maxLines: 2,
                softWrap: true,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.textSmall,
              )
            ],
          ),
        ),
      );
    }

    final _mainFeature = Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listMainFeature.getRange(0, 4).map((item) {
            return Expanded(
              flex: 1,
              child: mainItemContainer(
                item.url,
                item.title,
                item.index,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listMainFeature.getRange(4, 8).map((item) {
            return Expanded(
              flex: 1,
              child: mainItemContainer(
                item.url,
                item.title,
                item.index,
              ),
            );
          }).toList(),
        ),
      ],
    );

    final _headerRecommendedVideo = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Rekomendasi Video",
          style: AppTextStyle.textMedium.copyWith(
            color: AppColors.darkGreyDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            "Lainnya",
            style: AppTextStyle.textSmall.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );

    final _generatedRecomendedVideo = ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: RecommendedItem(
            "XXX",
            "XXX",
            "Dakwah",
            123456,
            DateTime.now(),
          ),
        );
      },
    );

    // Main of View
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 18.0),
          _upperHomeDescription,
          const SizedBox(height: 36.0),
          _banner,
          const SizedBox(height: 36.0),
          _mainFeature,
          const SizedBox(height: 36.0),
          _headerRecommendedVideo,
          const SizedBox(height: 21.0),
          _generatedRecomendedVideo,
        ],
      ),
    );
  }
}