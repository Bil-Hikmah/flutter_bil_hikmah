import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/screen/al_quran_page.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/screen/amalan_sunnah_page.dart';
import 'package:flutter_bil_hikmah/feature/dakwah_disabilitas/view/dakwah_disabilitas_page.dart';
import 'package:flutter_bil_hikmah/feature/game/screen/game_page.dart';
import 'package:flutter_bil_hikmah/feature/home/domain/repository/main_feature_item.dart';
import 'package:flutter_bil_hikmah/feature/home/logic/cubit/home_cubit.dart';
import 'package:flutter_bil_hikmah/feature/home/screen/section/carousel_banner.dart';
import 'package:flutter_bil_hikmah/feature/home/screen/section/recommended_item.dart';
import 'package:flutter_bil_hikmah/feature/home/screen/section/upper_home.dart';
import 'package:flutter_bil_hikmah/feature/poster/screen/poster_page.dart';
import 'package:flutter_bil_hikmah/feature/quran_disabilitas/screen/quran_disabilitas_page.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/screen/sign_language_page.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/video_dakwah_page.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView(this.state, {Key? key}) : super(key: key);

  final HomeState state;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    const _upperHomeDescription = UpperHome();
    // currently disabled
    // const _banner = BannerHome();
    const _carouselBanner = CarouselBanner();

    List<Function()> _onPressed = [
      () => Navigator.of(context).push(VideoDakwahPage.route(needAppBar: true)),
      () => Navigator.of(context).push(AlQuranPage.route(needBack: true)),
      () => Navigator.of(context).push(GamePage.route()),
      () => Navigator.of(context).push(DakwahDisabilitasPage.route()),
      () => Navigator.of(context).push(QurabDisabilitasPage.route()),
      () => Navigator.of(context).push(AmalanSunnah.route()),
      () => Navigator.of(context).push(SignLanguagePage.route()),
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

    final _mainFeature = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
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
          const SizedBox(height: 16.0),
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
      ),
    );

    final _headerRecommendedVideo = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
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
            onTap: () {
              Navigator.of(context)
                  .push(VideoDakwahPage.route(needAppBar: true));
            },
            child: Text(
              "Lainnya",
              style: AppTextStyle.textSmall.copyWith(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    final _generatedRecomendedVideo = ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemCount: 4,
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

    Widget headerAdhanSection() {
      return Row(
        children: [
          Text(
            "Jadwal Sholat - ${DateFormat("HH:mm:ss").format(widget.state.streamedTime ?? DateTime.now())}",
            style: AppTextStyle.textSmall.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.location_on,
            color: Colors.white,
            size: 14.0,
          ),
          const SizedBox(width: 6.0),
          InkWell(
            onTap: () {},
            child: Text(
              "Yogyakarta",
              style: AppTextStyle.textExtraSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    }

    Widget adhanScheduleItem(String timeName, String time) {
      return Column(
        children: [
          Text(
            timeName,
            style: AppTextStyle.textExtraSmall.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            time,
            style: AppTextStyle.textSmall.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }

    Widget adhanSchedule() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.transparent,
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            adhanScheduleItem(
              "Subuh",
              widget.state.adhanSchedule?.shubuh ?? "Null",
            ),
            adhanScheduleItem(
              "Dzuhur",
              widget.state.adhanSchedule?.dzuhur ?? "Null",
            ),
            adhanScheduleItem(
              "Ashar",
              widget.state.adhanSchedule?.ashr ?? "Null",
            ),
            adhanScheduleItem(
              "Maghrib",
              widget.state.adhanSchedule?.magrib ?? "Null",
            ),
            adhanScheduleItem(
              "Isya",
              widget.state.adhanSchedule?.isya ?? "Null",
            ),
          ],
        ),
      );
    }

    Widget adhanContainer() {
      return Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: const DecorationImage(
            image: AssetImage(UrlAsset.adhanBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            headerAdhanSection(),
            adhanSchedule(),
          ],
        ),
      );
    }

    // Main of View
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 18.0),
          _upperHomeDescription,
          const SizedBox(height: 36.0),
          _carouselBanner,
          const SizedBox(height: 36.0),
          _mainFeature,
          const SizedBox(height: 16.0),
          adhanContainer(),
          const SizedBox(height: 36.0),
          _headerRecommendedVideo,
          const SizedBox(height: 21.0),
          _generatedRecomendedVideo,
        ],
      ),
    );
  }
}
