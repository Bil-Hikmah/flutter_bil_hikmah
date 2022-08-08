import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        image: const DecorationImage(
          image: AssetImage(UrlAsset.homeBanner),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AppTextLargePrimary("Isya").copyWith(
            style: AppTextStyle.textLarge.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12.0),
          const AppTextTripleExtraLargePrimary("08:34 PM").copyWith(
            style: AppTextStyle.textTripleExtraLarge.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12.0),
          const AppTextSmallPrimary("Umbulharjo, Yogyakarta").copyWith(
            style: AppTextStyle.textSmall.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
