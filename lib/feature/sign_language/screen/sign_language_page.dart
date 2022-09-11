import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/screen/section/sign_language_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class SignLanguagePage extends StatelessWidget {
  const SignLanguagePage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (_) => const SignLanguagePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Bahasa Isyarat",
      ),
      body: const SignLanguageView(),
    );
  }
}
