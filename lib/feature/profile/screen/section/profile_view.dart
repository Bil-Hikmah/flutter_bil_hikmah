import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/auth/logic/authentication_cubit.dart';
import 'package:flutter_bil_hikmah/feature/login/logic/login_cubit.dart';
import 'package:flutter_bil_hikmah/feature/profile/domain/model/profile_item.dart';
import 'package:flutter_bil_hikmah/feature/profile/screen/edit_profile/edit_profile_page.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/button/default_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    Widget _headerProfile(AuthenticationState state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryDark,
                  image: DecorationImage(
                    image: NetworkImage(
                      context
                              .read<AuthenticationCubit>()
                              .state
                              .user
                              ?.avatarURL ??
                          "Unknown Avatar",
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 24.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.user?.displayName ?? "Unknown Name",
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.textLarge.copyWith(
                        color: AppColors.darkGreyDarkest,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      state.user?.email ?? "Unknown Email",
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.textSmall.copyWith(
                        color: AppColors.darkGreyLightest,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(EditProfilePage.route());
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              )
            ],
          ),
        );

    Widget _actionItemContainer(
      IconData icon,
      String title,
      void Function() onTap,
    ) {
      return InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 24.0,
                color: AppColors.primaryDark,
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Text(
                  title,
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
        ),
      );
    }

    final _actionItem = List.generate(
      listProfileItemAction(context).length,
      (index) {
        return Column(
          children: [
            _actionItemContainer(
              listProfileItemAction(context)[index].icon,
              listProfileItemAction(context)[index].title,
              listProfileItemAction(context)[index].route,
            ),
            const Divider(
              color: AppColors.lightGreyLight,
            )
          ],
        );
      },
    );

    Widget logoutButton() {
      return ButtonDefault(
        text: "Keluar",
        trailingIcon: const Icon(
          Icons.logout_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          context.read<LoginCubit>().signOutGoogle();
          context.read<AuthenticationCubit>().signOut();
        },
      );
    }

    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _headerProfile(state),
              ..._actionItem,
              const SizedBox(height: 24.0),
              logoutButton(),
              const SizedBox(height: 24.0),
            ],
          ),
        );
      },
    );
  }
}
