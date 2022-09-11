import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/screen/detail_sign_language/section/detail_sign_language_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class DetailSignLanguagePage extends StatelessWidget {
  const DetailSignLanguagePage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => const DetailSignLanguagePage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: "Bahasa Isyarat"),
      body: const DetailSignLangugeView(),
    );
  }
}
