import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/screen/detail_surah/detail_surah_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class DetailSurahPage extends StatelessWidget {
  const DetailSurahPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => const DetailSurahPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Detail Surah",
      ),
      body: const DetailSurahView(),
    );
  }
}
