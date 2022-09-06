import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/profile/screen/section/profile_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Profile",
        needBack: false,
      ),
      body: const ProfileView(),
    );
  }
}
