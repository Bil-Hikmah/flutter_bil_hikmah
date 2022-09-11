import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/video_dakwah_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class VideoDakwahPage extends StatelessWidget {
  const VideoDakwahPage({this.needAppBar = false, Key? key}) : super(key: key);

  final bool needAppBar;

  static Route route({bool needAppBar = false}) => MaterialPageRoute(
        builder: (_) => VideoDakwahPage(
          needAppBar: needAppBar,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: needAppBar
            ? defaultAppBar(context: context, title: "Video Dakwah")
            : null,
        backgroundColor: Colors.white,
        body: VideoDakwahView(needAppBar ? false : true),
      ),
    );
  }
}
