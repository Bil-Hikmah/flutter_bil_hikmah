import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/button/default_button.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage(this.description, {Key? key}) : super(key: key);

  final String description;

  static Route route(String description) {
    return MaterialPageRoute<void>(builder: (_) => SuccessPage(description));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              UrlAsset.successIconJson,
              height: 250.0,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
            Text(
              "Sukses",
              style: AppTextStyle.textExtraLarge.copyWith(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: AppTextStyle.textSmall.copyWith(
                color: AppColors.darkGreyLightest,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            ButtonDefault(
              text: "Kembali",
              onPressed: Navigator.of(context).pop,
            ),
          ],
        ),
      ),
    );
  }
}
