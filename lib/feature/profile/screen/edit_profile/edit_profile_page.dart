import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/auth/logic/authentication_cubit.dart';
import 'package:flutter_bil_hikmah/feature/profile/logic/profile_cubit.dart';
import 'package:flutter_bil_hikmah/feature/profile/screen/edit_profile/edit_profile_view.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const EditProfilePage(),
      settings: const RouteSettings(name: "/edit-profile"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: ProgressHUD(
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state.status == ProfileStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.errorMessage),
                ),
              );
            }
            if (state.status == ProfileStatus.successUpdateDisplayName) {
              BlocProvider.of<AuthenticationCubit>(context)
                  .changeDisplayName(state.updatedDisplayName);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: AppColors.primaryDark,
                  content: Text("Sukses mengubah nama"),
                ),
              );
            }
            if (state.status == ProfileStatus.loading) {
              ProgressHUD.of(context)?.show();
            } else {
              ProgressHUD.of(context)?.dismiss();
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: defaultAppBar(
                context: context,
                title: "Edit Profile",
              ),
              backgroundColor: Colors.white,
              body: const EditProfileView(),
            );
          },
        ),
      ),
    );
  }
}
