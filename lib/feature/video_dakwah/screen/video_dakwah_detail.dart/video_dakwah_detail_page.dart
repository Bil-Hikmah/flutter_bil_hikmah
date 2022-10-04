import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_item.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/video_dakwah_detail.dart/video_dakwah_detail_view.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/field/iframe_youtube_player.dart';

class VideoDakwahDetailPage extends StatelessWidget {
  const VideoDakwahDetailPage(this.initVideoUrl, this.data, {Key? key})
      : super(key: key);

  final String initVideoUrl;
  final List<VideoItemData> data;

  static Route route(
    String initVideoUrl,
    List<VideoItemData> data,
  ) {
    return MaterialPageRoute(
      builder: (context) => VideoDakwahDetailPage(
        initVideoUrl,
        data,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IframeYoutubePlayer(
      initVideoUrl,
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
            data,
          ),
        );
      }),
    );
  }
}
