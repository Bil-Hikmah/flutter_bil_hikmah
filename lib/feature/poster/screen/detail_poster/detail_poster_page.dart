import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/poster/screen/detail_poster/section/detail_poster_view.dart';

class DetailPosterPage extends StatelessWidget {
  const DetailPosterPage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (_) => const DetailPosterPage());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: DetailPosterView()),
    );
  }
}
