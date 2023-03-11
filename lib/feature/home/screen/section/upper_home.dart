import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/feature/auth/logic/authentication_cubit.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpperHome extends StatelessWidget {
  const UpperHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            UrlAsset.logoWT,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const AppTextLargePrimary("Assalamu'alaikum").copyWith(
                style: AppTextStyle.textLarge.copyWith(
                  color: AppColors.darkGreyLightest,
                ),
              ),
              AppTextLargeGreen(context
                          .read<AuthenticationCubit>()
                          .state
                          .user
                          ?.displayName ??
                      "Unknown Name")
                  .copyWith(
                style: AppTextStyle.textLarge.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
