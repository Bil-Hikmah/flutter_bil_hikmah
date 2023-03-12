import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

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
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Edit Profile",
      ),
      body: const Center(
        child: Text("Edit Profile"),
      ),
    );
  }
}
