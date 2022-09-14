import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/about/screen/section/about_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const AboutPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Tentang Aplikasi",
      ),
      body: const AboutView(),
    );
  }
}
