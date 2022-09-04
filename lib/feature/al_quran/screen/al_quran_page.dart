import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/screen/section/al_quran_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class AlQuranPage extends StatelessWidget {
  const AlQuranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Al-Qur'an",
        needBack: false,
      ),
      body: const AlQuranView(),
    );
  }
}
