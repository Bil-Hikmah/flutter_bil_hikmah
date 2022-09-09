import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class AmalanSunnahView extends StatefulWidget {
  const AmalanSunnahView({Key? key}) : super(key: key);

  @override
  State<AmalanSunnahView> createState() => _AmalanSunnahViewState();
}

class _AmalanSunnahViewState extends State<AmalanSunnahView> {
  @override
  Widget build(BuildContext context) {
    Widget _amalanSunnahContainerItem() => InkWell(
          onTap: () {},
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
                    "Amalan Sunnah",
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
                child: _amalanSunnahContainerItem(),
              )
            : _amalanSunnahContainerItem();
      },
    );
  }
}
