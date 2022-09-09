import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/amalan_sunnah/screen/section/amalan_sunnah_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class AmalanSunnah extends StatelessWidget {
  const AmalanSunnah({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => const AmalanSunnah());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Amalan Sunnah",
      ),
      body: const AmalanSunnahView(),
    );
  }
}
