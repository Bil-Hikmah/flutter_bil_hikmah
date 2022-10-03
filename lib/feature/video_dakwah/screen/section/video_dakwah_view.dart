import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/logic/video_dakwah_cubit.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/dummy_video_item.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_genre_response.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_item.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/genre_video.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/list_video_item.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/video_dakwah_detail.dart/video_dakwah_detail_page.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/widget/field/default_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoDakwahView extends StatefulWidget {
  const VideoDakwahView(
    this.needMoreUpperSpace,
    this.videoGenreData, {
    Key? key,
  }) : super(key: key);

  final bool needMoreUpperSpace;
  final List<VideoTypesData> videoGenreData;

  @override
  State<VideoDakwahView> createState() => _VideoDakwahViewState();
}

class _VideoDakwahViewState extends State<VideoDakwahView> {
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _searchField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: DefaultTextField(
        hintText: "Search something ....",
        controller: _searchController,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Please fill this field";
          }
          return null;
        },
      ),
    );

    final _buildGendreVideo = SizedBox(
      height: 46.0,
      child: GenreVideo(
        _currentIndex,
        widget.videoGenreData,
        (int index) {
          setState(() {
            if (_currentIndex == index) {
              _currentIndex = 0;
              context.read<VideoDakwahCubit>().onGetVideoGenre(0);
            } else {
              _currentIndex = index;
              context.read<VideoDakwahCubit>().onGetVideoGenre(index);
            }
          });
        },
      ),
    );

    Widget _buildListVideo(List<VideoItemData> data) => ListVideoItem(
          dummyListVideoItem,
          (DummyVideoItem item) {
            // Todo : open video detail
            Navigator.of(context).push(VideoDakwahDetailPage.route());
          },
        );

    return BlocBuilder<VideoDakwahCubit, VideoDakwahState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.needMoreUpperSpace
                  ? const SizedBox(height: 24.0)
                  : const SizedBox(),
              _searchField,
              const SizedBox(height: 12.0),
              _buildGendreVideo,
              const SizedBox(height: 24.0),
              state.status.isLoadingVideo || state.status.isFailure
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryDark,
                    )
                  : _buildListVideo(state.videoDakwahItem!),
            ],
          ),
        );
      },
    );
  }
}
