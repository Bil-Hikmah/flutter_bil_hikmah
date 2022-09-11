import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/button/default_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final _headerProfile = Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(width: 24.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Adrianto Wawa Surya",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.textLarge.copyWith(
                    color: AppColors.darkGreyDarkest,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  "wawaAnto@gmail.com",
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.textSmall.copyWith(
                    color: AppColors.darkGreyLightest,
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDark,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Edit Profile",
                        style: AppTextStyle.textExtraSmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 12.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    Widget _actionItemContainer() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.favorite_border,
              size: 24.0,
              color: AppColors.primaryDark,
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Text(
                "Favorite",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: AppTextStyle.textMedium.copyWith(
                  color: AppColors.darkGreyDarkest,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 24.0,
              color: AppColors.primaryDark,
            ),
          ],
        ),
      );
    }

    final _actionItem = List.generate(
      7,
      (index) {
        return Column(
          children: [
            _actionItemContainer(),
            const Divider(
              color: AppColors.lightGreyLight,
            )
          ],
        );
      },
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _headerProfile,
          ..._actionItem,
          const SizedBox(height: 50.0),
          ButtonDefault(
            text: "Keluar",
            trailingIcon: const Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}