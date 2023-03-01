import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/repository/dakwah_genre.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/logic/video_dakwah_cubit.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/genre_video.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/list_video_item.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/video_dakwah_detail.dart/video_dakwah_detail_page.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/widget/field/default_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoDakwahView extends StatefulWidget {
  const VideoDakwahView(
    this.needMoreUpperSpace, {
    Key? key,
  }) : super(key: key);

  final bool needMoreUpperSpace;

  @override
  State<VideoDakwahView> createState() => _VideoDakwahViewState();
}

class _VideoDakwahViewState extends State<VideoDakwahView> {
  int currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _searchField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: DefaultTextField(
        hintText: "Search something ....",
        controller: _searchController,
        suffixWidget: GestureDetector(
            onTap: () {
              currentIndex = 0;
              context
                  .read<VideoDakwahCubit>()
                  .onGetVideoWithSearch(_searchController.text);
              _searchController.clear();
            },
            child: const Icon(Icons.search, color: AppColors.primaryDark)),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Please fill this field";
          }
          return null;
        },
        onSubmitedValue: (String? value) {
          if (value != null) {
            currentIndex = 0;
            context.read<VideoDakwahCubit>().onGetVideoWithSearch(value);
            _searchController.clear();
          }
        },
      ),
    );

    final _buildGendreVideo = SizedBox(
      height: 46.0,
      child: GenreVideo(
        currentIndex,
        stringGenre,
        (int index) {
          if (currentIndex == index) return;
          setState(() {
            currentIndex = index;
            context
                .read<VideoDakwahCubit>()
                .onGetVideoWithGenre(stringGenre[currentIndex - 1]);
          });
        },
      ),
    );

    Widget _buildListVideo(List<VideoDakwahModels> data) => ListVideoItem(
          data,
          (VideoDakwahModels item) {
            // Todo : open video detail
            Navigator.of(context).push(VideoDakwahDetailPage.route(
              item.videoURL,
              item,
              data,
            ));
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
              state.status.isLoadingVideo ||
                      state.status.isFailure ||
                      state.status.isLoadingGenre
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ),
                    )
                  : _buildListVideo(state.videoDakwahItem!),
            ],
          ),
        );
      },
    );
  }
}
