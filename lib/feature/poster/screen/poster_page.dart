import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/poster/screen/section/poster_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class PosterPage extends StatelessWidget {
  const PosterPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(builder: (_) => const PosterPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Poster",
      ),
      backgroundColor: Colors.white,
      body: const PosterView(),
    );
  }
}
