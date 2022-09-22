import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/domain/model/surah_item.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailSurahView extends StatefulWidget {
  const DetailSurahView(this.surahDetail, {Key? key}) : super(key: key);

  final SurahItemData surahDetail;

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
            widget.surahDetail.name.transliteration.id,
            style: AppTextStyle.textDoubleExtraLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            widget.surahDetail.name.translation.id,
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
                  widget.surahDetail.revelation.id,
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
                  "${widget.surahDetail.numberOfVerses} Ayat",
                  style: AppTextStyle.textMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          widget.surahDetail.preBismillah != null
              ? SvgPicture.asset(UrlAsset.bismillah)
              : const SizedBox(),
        ],
      ),
    );

    Widget _surahItem(Verse verse) {
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
                        verse.number.inSurah.toString(),
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
              verse.text.arab,
              softWrap: true,
              maxLines: 10,
              textAlign: TextAlign.right,
              style: AppTextStyle.textLarge
                  .copyWith(color: AppColors.darkGreyDark),
            ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  verse.translation.id,
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
      itemCount: widget.surahDetail.verses.length,
      itemBuilder: (context, index) {
        return _surahItem(
          widget.surahDetail.verses[index],
        );
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
