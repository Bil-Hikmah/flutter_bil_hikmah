import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/field/iframe_youtube_player.dart';

class QuranDisabilitasDetailPage extends StatelessWidget {
  const QuranDisabilitasDetailPage(this.videoURL, {Key? key}) : super(key: key);

  static Route route(String videoURL) {
    return MaterialPageRoute(
      builder: (context) => QuranDisabilitasDetailPage(videoURL),
      settings: const RouteSettings(name: '/quran_disabilitas_detail'),
    );
  }

  final String videoURL;

  @override
  Widget build(BuildContext context) {
    return IframeYoutubePlayer(
      videoURL,
      body: ((context, player, controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Video Dakwah Detail',
              style: AppTextStyle.textMedium.copyWith(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: AppColors.primaryDark,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: player,
        );
      }),
      isNeedInitFullScreen: true,
    );
  }
}
