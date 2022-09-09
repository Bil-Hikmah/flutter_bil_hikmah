import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/akhlak_mulia/screen/section/akhlak_mulia_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class AkhlakMuliaPage extends StatelessWidget {
  const AkhlakMuliaPage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (_) => const AkhlakMuliaPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Akhlak Mulia",
      ),
      body: const AkhlakMuliaView(),
    );
  }
}
