import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/model/quran_item.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/screen/detail_surah/detail_surah_page.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class AlQuranView extends StatefulWidget {
  const AlQuranView(
    this.quranData, {
    Key? key,
  }) : super(key: key);

  final List<QuranItemData> quranData;

  @override
  State<AlQuranView> createState() => _AlQuranViewState();
}

class _AlQuranViewState extends State<AlQuranView> {
  @override
  Widget build(BuildContext context) {
    final _descBanner = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.menu_book,
                  color: Colors.white,
                  size: 20.0,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    "Terakhir Dibaca",
                    style: AppTextStyle.textMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            "Al-Fatihah",
            style: AppTextStyle.textLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            "Ayat No. X / Arti Surah",
            style: AppTextStyle.textMedium.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    final _banner = Container(
      height: 131.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.primaryDark,
      ),
      child: Stack(
        children: [
          _descBanner,
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(UrlAsset.alQuran),
          )
        ],
      ),
    );

    Widget _surahDescription(
      String surahName,
      Id surahRevelation,
      int numberOfVerses,
    ) =>
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              surahName,
              style: AppTextStyle.textMedium.copyWith(
                color: AppColors.darkGreyMedium,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                Text(
                  surahRevelation.name,
                  style: AppTextStyle.textSmall.copyWith(
                    color: AppColors.darkGreyLightest,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4.0),
                const Icon(
                  Icons.circle,
                  size: 4.0,
                  color: AppColors.lightGreyMedium,
                ),
                const SizedBox(width: 4.0),
                Text(
                  "$numberOfVerses Ayat",
                  style: AppTextStyle.textSmall.copyWith(
                    color: AppColors.darkGreyLightest,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        );

    Widget _surahCard(
      int index,
      QuranItemData data,
    ) {
      return Column(
        children: [
          const SizedBox(height: 16.0),
          Row(
            children: [
              Container(
                height: 44.0,
                width: 44.0,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(UrlAsset.frameAlquranNumber),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.textMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: _surahDescription(
                  data.name.transliteration.id,
                  data.revelation.id,
                  data.numberOfVerses,
                ),
              ),
              Text(
                data.name.short,
                textAlign: TextAlign.end,
                style: AppTextStyle.quranTextLarge.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Divider(color: AppColors.lightGreyMedium)
        ],
      );
    }

    final _listSurah = ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.quranData.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // Navigate to detail surah
            Navigator.of(context).push(DetailSurahPage.route(
              widget.quranData[index].number,
            ));
          },
          child: _surahCard(
            index,
            widget.quranData[index],
          ),
        );
      },
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _banner,
          const SizedBox(height: 16.0),
          _listSurah,
        ],
      ),
    );
  }
}
