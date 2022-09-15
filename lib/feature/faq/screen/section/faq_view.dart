import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/field/faq_tile.dart';

class FAQView extends StatefulWidget {
  const FAQView({Key? key}) : super(key: key);

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  @override
  Widget build(BuildContext context) {
    Widget _headerText(String text) => Text(
          text,
          style: AppTextStyle.textExtraLarge.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.darkGreyDark,
          ),
        );
    Widget _headerDescText(String text) => Text(
          text,
          style: AppTextStyle.textMedium.copyWith(
            color: AppColors.darkGreyDark,
          ),
        );
    List<Widget> _buildFaq() => List.generate(
          5,
          (index) => fAQTile(
            index,
            "Pertanyaan $index",
            "Jawaban $index",
          ),
        );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerText("Frequently Ask Question (FAQ)"),
          const SizedBox(height: 4.0),
          _headerDescText("Ragam pertanyaan yang serting ditanyakan"),
          const SizedBox(height: 24.0),
          ..._buildFaq(),
        ],
      ),
    );
  }
}
