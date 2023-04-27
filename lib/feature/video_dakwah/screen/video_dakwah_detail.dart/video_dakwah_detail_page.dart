import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/logic/video_dakwah_cubit.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_repository.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/video_dakwah_detail.dart/video_dakwah_detail_view.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/field/iframe_youtube_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoDakwahDetailPage extends StatelessWidget {
  const VideoDakwahDetailPage(
    this.initVideoUrl,
    this.singleData,
    this.data, {
    Key? key,
  }) : super(key: key);

  final String initVideoUrl;
  final VideoDakwahModels singleData;
  final List<VideoDakwahModels> data;

  static Route route(
    String initVideoUrl,
    VideoDakwahModels singleData,
    List<VideoDakwahModels> data,
  ) {
    return MaterialPageRoute(
      builder: (context) => VideoDakwahDetailPage(
        initVideoUrl,
        singleData,
        data,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoDakwahCubit(VideoDakwahRepositoryImpl.create())
        ..onGetYouTubeMetaData(initVideoUrl),
      child: IframeYoutubePlayer(
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
              singleData,
              data,
            ),
          );
        }),
      ),
    );
  }
}
