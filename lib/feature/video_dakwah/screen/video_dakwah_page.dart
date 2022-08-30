import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/video_dakwah_view.dart';

class VideoDakwahPage extends StatelessWidget {
  const VideoDakwahPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: VideoDakwahView(),
      ),
    );
  }
}
