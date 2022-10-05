import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/shadow.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    Widget aboutSocialButton(
      BuildContext context,
      String title,
      Widget icon,
      void Function() onPressed,
    ) {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: ((MediaQuery.of(context).size.width - 48) / 3) - 10.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 4.0,
            vertical: 4.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: AppShadow.card1,
          ),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 4.0),
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.textSmall.copyWith(
                    color: AppColors.darkGreyDarkest,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            UrlAsset.logo,
            width: 120.0,
            height: 120.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 18.0),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.textSmall.copyWith(
              color: AppColors.darkGreyLightest,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            "Ikuti Kami",
            textAlign: TextAlign.center,
            style: AppTextStyle.textMedium.copyWith(
              color: AppColors.darkGreyDarkest,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              aboutSocialButton(
                context,
                "Facebook",
                const Icon(Icons.facebook_outlined,
                    color: Colors.blue, size: 24.0),
                () {},
              ),
              aboutSocialButton(
                context,
                "Instagram",
                const Icon(Icons.facebook_outlined,
                    color: Colors.blue, size: 24.0),
                () {},
              ),
              aboutSocialButton(
                context,
                "Twitter",
                const Icon(Icons.facebook_outlined,
                    color: Colors.blue, size: 24.0),
                () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
