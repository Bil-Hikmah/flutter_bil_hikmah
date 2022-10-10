import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/domain/models/list_sign_dummy.dart';
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
    Widget _singLanguageContainerItem(
      String title,
      int id,
    ) =>
        InkWell(
          onTap: () {
            Navigator.of(context).push(DetailSignLanguagePage.route(
              title,
              id,
            ));
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
                    title,
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
      itemCount: listSignItemDummy.length,
      itemBuilder: (context, index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: _singLanguageContainerItem(
                    listSignItemDummy[index].title,
                    listSignItemDummy[index].id),
              )
            : _singLanguageContainerItem(
                listSignItemDummy[index].title,
                listSignItemDummy[index].id,
              );
      },
    );
  }
}
