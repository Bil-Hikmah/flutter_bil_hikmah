import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_item.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/list_video_item.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoDakwahDetailView extends StatefulWidget {
  const VideoDakwahDetailView(
    this.player,
    this.controller,
    this.data, {
    Key? key,
  }) : super(key: key);

  final Widget player;
  final YoutubePlayerController controller;
  final List<VideoItemData> data;

  @override
  State<VideoDakwahDetailView> createState() => _VideoDakwahDetailViewState();
}

class _VideoDakwahDetailViewState extends State<VideoDakwahDetailView> {
  @override
  Widget build(BuildContext context) {
    final _videoTitle = Text(
      'Video Dakwah',
      softWrap: true,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyle.textMedium.copyWith(
        color: AppColors.darkGreyDark,
        fontWeight: FontWeight.w500,
      ),
    );

    final _videoStatistic = Row(
      children: [
        Text(
          "10300 Views",
          style: AppTextStyle.textExtraSmall.copyWith(
            color: AppColors.darkGreyLightest,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8.0),
        const Icon(
          Icons.circle,
          color: AppColors.darkGreyLightest,
          size: 4.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          "1 July 2021",
          style: AppTextStyle.textExtraSmall.copyWith(
            color: AppColors.darkGreyLightest,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );

    final _videSocialshare = Row(
      children: [
        Expanded(
          child: Text(
            "Kultum",
            style: AppTextStyle.textMedium.copyWith(
              color: AppColors.darkGreyMedium,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Icon(
          Icons.favorite_border,
          color: AppColors.primaryDark,
          size: 21.0,
        ),
        const SizedBox(width: 6.0),
        Text(
          "102 K",
          style: AppTextStyle.textSmall.copyWith(
            color: AppColors.darkGreyLight,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 24.0),
        const Icon(
          Icons.share,
          color: AppColors.primaryDark,
          size: 21.0,
        ),
        const SizedBox(width: 6.0),
        Text(
          "Share",
          style: AppTextStyle.textSmall.copyWith(
            color: AppColors.darkGreyLight,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );

    final _videoDesc = Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _videoTitle,
          const SizedBox(height: 10.0),
          _videoStatistic,
          const SizedBox(height: 10.0),
          _videSocialshare,
        ],
      ),
    );

    final _titleHeaderMoreVideo = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        "More Video Dakwah",
        style: AppTextStyle.textMedium.copyWith(
          color: AppColors.darkGreyDarkest,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final _buildListVideo = ListVideoItem(
      widget.data,
      (VideoItemData item) {
        // Todo : open video detail
        widget.controller.loadVideo(item.videoUrl);
      },
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.player,
          const SizedBox(height: 8.0),
          _videoDesc,
          const SizedBox(height: 10.0),
          const Divider(color: AppColors.lightGreyDark),
          const SizedBox(height: 12.0),
          _titleHeaderMoreVideo,
          const SizedBox(height: 21.0),
          _buildListVideo,
        ],
      ),
    );
  }
}
