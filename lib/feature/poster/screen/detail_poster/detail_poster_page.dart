import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/poster/screen/detail_poster/section/detail_poster_view.dart';

class DetailPosterPage extends StatelessWidget {
  const DetailPosterPage(this.urlImage, {Key? key}) : super(key: key);

  final String urlImage;

  static Route route(
    String urlImage,
  ) =>
      MaterialPageRoute(builder: (_) => DetailPosterPage(urlImage));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: DetailPosterView(urlImage)),
    );
  }
}
