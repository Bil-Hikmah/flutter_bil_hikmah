import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/logic/video_dakwah_cubit.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/list_video_item.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/field/bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:api_exception/exception.dart';

class VideoDakwahDetailView extends StatefulWidget {
  const VideoDakwahDetailView(
    this.player,
    this.controller,
    this.singleData,
    this.data, {
    Key? key,
  }) : super(key: key);

  final Widget player;
  final YoutubePlayerController controller;
  final VideoDakwahModels singleData;
  final List<VideoDakwahModels> data;

  @override
  State<VideoDakwahDetailView> createState() => _VideoDakwahDetailViewState();
}

class _VideoDakwahDetailViewState extends State<VideoDakwahDetailView> {
  late String category;
  late DateTime createdAt;

  @override
  void initState() {
    category = widget.singleData.genre;
    createdAt = widget.singleData.dateCreated;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _videoTitle(String title) => Text(
          title,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.textMedium.copyWith(
            color: AppColors.darkGreyDark,
            fontWeight: FontWeight.w500,
          ),
        );

    Widget _videoStatistic(int countView, String createdAt) => Row(
          children: [
            Text(
              "$countView Views",
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
              createdAt,
              style: AppTextStyle.textExtraSmall.copyWith(
                color: AppColors.darkGreyLightest,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );

    Widget _videSocialshare(
      double rate, {
      required void Function() onShare,
    }) =>
        Row(
          children: [
            Expanded(
              child: Text(
                category,
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
              "Rate: $rate",
              style: AppTextStyle.textSmall.copyWith(
                color: AppColors.darkGreyLight,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 24.0),
            InkWell(
              onTap: () {
                onShare();
              },
              child: const Icon(
                Icons.share,
                color: AppColors.primaryDark,
                size: 21.0,
              ),
            ),
            const SizedBox(width: 6.0),
            InkWell(
              onTap: () {
                onShare();
              },
              child: Text(
                "Share",
                style: AppTextStyle.textSmall.copyWith(
                  color: AppColors.darkGreyLight,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );

    Widget videoDesc(VideoDakwahState state) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _videoTitle(
                state.status.isLoading
                    ? "Loading..."
                    : state.youtubeDataModel?.title ?? "Loading",
              ),
              const SizedBox(height: 10.0),
              _videoStatistic(
                state.status.isLoading
                    ? 0
                    : state.youtubeDataModel?.viewCount ?? 0,
                state.status.isLoading
                    ? "Loading..."
                    : state.youtubeDataModel?.authorName ?? "Loading",
              ),
              const SizedBox(height: 10.0),
              _videSocialshare(
                state.status.isLoading
                    ? 0
                    : state.youtubeDataModel?.averageRating ?? 0,
                onShare: () async {
                  showShareBottomSheet(
                    context,
                    await widget.controller.videoUrl,
                  );
                },
              ),
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
      (VideoDakwahModels item) {
        // Todo : open video detail
        widget.controller.loadVideo(item.videoURL);
        context.read<VideoDakwahCubit>().onGetYouTubeMetaData(item.videoURL);
      },
    );

    return BlocConsumer<VideoDakwahCubit, VideoDakwahState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar
            ..showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  state.exception?.errorMessage(context) ?? "Unknown Error",
                  style: AppTextStyle.textMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.player,
              const SizedBox(height: 8.0),
              videoDesc(state),
              const SizedBox(height: 10.0),
              const Divider(color: AppColors.lightGreyDark),
              const SizedBox(height: 12.0),
              _titleHeaderMoreVideo,
              const SizedBox(height: 21.0),
              _buildListVideo,
            ],
          ),
        );
      },
    );
  }
}
