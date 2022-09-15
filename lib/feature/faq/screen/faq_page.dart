import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/faq/screen/section/faq_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const FAQPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Bantuan",
      ),
      body: const FAQView(),
    );
  }
}
