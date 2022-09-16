import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/video_dakwah_detail.dart/video_dakwah_detail_view.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/field/iframe_youtube_player.dart';

class VideoDakwahDetailPage extends StatelessWidget {
  const VideoDakwahDetailPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const VideoDakwahDetailPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IframeYoutubePlayer(
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
          body: VideoDakwahDetailView(
            player,
            controller,
          ),
        );
      }),
    );
  }
}
