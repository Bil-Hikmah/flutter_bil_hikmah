import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/screen/section/al_quran_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class AlQuranPage extends StatelessWidget {
  const AlQuranPage({this.needBack = false, Key? key}) : super(key: key);

  final bool needBack;

  static Route route({bool needBack = false}) => MaterialPageRoute(
      builder: (_) => AlQuranPage(
            needBack: needBack,
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Al-Qur'an",
        needBack: needBack,
      ),
      body: const AlQuranView(),
    );
  }
}
