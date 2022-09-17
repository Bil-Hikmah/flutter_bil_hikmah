import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class DefaultDetailView extends StatefulWidget {
  const DefaultDetailView(
    this.title,
    this.content, {
    Key? key,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  State<DefaultDetailView> createState() => _DefaultDetailViewState();
}

class _DefaultDetailViewState extends State<DefaultDetailView> {
  @override
  Widget build(BuildContext context) {
    Widget _banner(
      String title,
    ) =>
        Container(
          height: 142.0,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(UrlAsset.signLanguageBanner),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.textExtraLarge.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

    Widget _generateContent(String text) => Text(
          text,
          softWrap: true,
          style: AppTextStyle.textMedium.copyWith(
            color: AppColors.darkGreyMedium,
          ),
        );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          _banner(widget.title),
          const SizedBox(height: 18.0),
          _generateContent(widget.content),
        ],
      ),
    );
  }
}
