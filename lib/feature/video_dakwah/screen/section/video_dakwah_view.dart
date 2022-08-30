import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/dummy_video_genre.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/dummy_video_item.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/genre_video.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/section/list_video_item.dart';
import 'package:flutter_bil_hikmah/widget/field/default_text_field.dart';

class VideoDakwahView extends StatefulWidget {
  const VideoDakwahView({Key? key}) : super(key: key);

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
        listGenreVideo,
        (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );

    final _buildListVideo = ListVideoItem(
      dummyListVideoItem,
      (DummyVideoItem item) {
        // Todo : open video detail
      },
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24.0),
          _searchField,
          const SizedBox(height: 12.0),
          _buildGendreVideo,
          const SizedBox(height: 24.0),
          _buildListVideo,
        ],
      ),
    );
  }
}
