import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/screen/detail_sign_language/detail_sign_language_page.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class SignLanguageView extends StatefulWidget {
  const SignLanguageView({Key? key}) : super(key: key);

  @override
  State<SignLanguageView> createState() => _SignLanguageViewState();
}

class _SignLanguageViewState extends State<SignLanguageView> {
  @override
  Widget build(BuildContext context) {
    Widget _singLanguageContainerItem() => InkWell(
          onTap: () {
            Navigator.of(context).push(DetailSignLanguagePage.route());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 29,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.lightGreyLight,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Abjad",
                    style: AppTextStyle.textLarge
                        .copyWith(color: AppColors.darkGreyDark),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.primaryDark,
                ),
              ],
            ),
          ),
        );

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: 5,
      itemBuilder: (context, index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: _singLanguageContainerItem(),
              )
            : _singLanguageContainerItem();
      },
    );
  }
}
