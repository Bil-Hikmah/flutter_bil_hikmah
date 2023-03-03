import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/domain/models/sign_language_response.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/logic/cubit/sign_language_cubit.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/screen/detail_sign_language/detail_sign_language_page.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class SignLanguageView extends StatefulWidget {
  const SignLanguageView(this.state, {Key? key}) : super(key: key);

  final SignLanguageState state;

  @override
  State<SignLanguageView> createState() => _SignLanguageViewState();
}

class _SignLanguageViewState extends State<SignLanguageView> {
  @override
  Widget build(BuildContext context) {
    Widget _singLanguageContainerItem(
      String title,
      List<SignLanguageDetail> data,
    ) =>
        InkWell(
          onTap: () {
            Navigator.of(context).push(DetailSignLanguagePage.route(
              title,
              data,
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
      itemCount: widget.state.signLanguageResponse.length,
      itemBuilder: (context, index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: _singLanguageContainerItem(
                  widget.state.signLanguageResponse[index].name,
                  widget.state.signLanguageResponse[index].details,
                ),
              )
            : _singLanguageContainerItem(
                widget.state.signLanguageResponse[index].name,
                widget.state.signLanguageResponse[index].details,
              );
      },
    );
  }
}
