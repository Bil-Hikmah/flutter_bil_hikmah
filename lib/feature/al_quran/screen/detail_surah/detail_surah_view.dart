import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailSurahView extends StatefulWidget {
  const DetailSurahView({Key? key}) : super(key: key);

  @override
  State<DetailSurahView> createState() => _DetailSurahViewState();
}

class _DetailSurahViewState extends State<DetailSurahView> {
  @override
  Widget build(BuildContext context) {
    final _banner = Container(
      height: 265.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: const DecorationImage(
          image: AssetImage(UrlAsset.detailQuranBanner),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Al-Fatihah",
            style: AppTextStyle.textDoubleExtraLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            "Arti Surah",
            style: AppTextStyle.textLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16.0),
          Divider(
            color: Colors.white.withOpacity(0.35),
            thickness: 2.0,
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Makiyah",
                  style: AppTextStyle.textMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 5.0),
                Icon(
                  Icons.circle,
                  color: Colors.white.withOpacity(0.35),
                  size: 4.0,
                ),
                const SizedBox(width: 5.0),
                Text(
                  "7 Ayat",
                  style: AppTextStyle.textMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(UrlAsset.bismillah),
        ],
      ),
    );

    Widget _surahItem() {
      return Container(
        margin: const EdgeInsets.only(top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryLightest,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4.0,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryDark,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "1",
                        style: AppTextStyle.textMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Icon(
                    Icons.share_outlined,
                    color: AppColors.primaryDark,
                    size: 24.0,
                  ),
                  const SizedBox(width: 16.0),
                  const Icon(
                    Icons.play_arrow_outlined,
                    color: AppColors.primaryDark,
                    size: 24.0,
                  ),
                  const SizedBox(width: 16.0),
                  const Icon(
                    Icons.bookmark_border,
                    color: AppColors.primaryDark,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              "Font Quran asasd asdas \n",
              textDirection: TextDirection.rtl,
              softWrap: true,
              style: AppTextStyle.textLarge
                  .copyWith(color: AppColors.darkGreyDark),
            ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yang Maha Pengasih lagi Maha Penyayang,",
                  softWrap: true,
                  style: AppTextStyle.textLarge
                      .copyWith(color: AppColors.darkGreyDark),
                ),
                const SizedBox(height: 16.0),
                const Divider(color: AppColors.lightGreyDark),
              ],
            )
          ],
        ),
      );
    }

    final _listSurahItem = ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return _surahItem();
      },
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _banner,
          _listSurahItem,
        ],
      ),
    );
  }
}
