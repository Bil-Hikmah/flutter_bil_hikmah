import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/dummy_video_genre.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class GenreVideo extends StatelessWidget {
  const GenreVideo(
    this.currentindex,
    this.genreVideo,
    this.onTap, {
    Key? key,
  }) : super(key: key);

  final int currentindex;
  final List<DummyVideoGenre> genreVideo;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    Widget _genreItemContainer(
      int index,
      String title,
    ) =>
        InkWell(
          onTap: () {
            onTap(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            margin: const EdgeInsets.only(right: 12.0),
            height: 46.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: index == currentindex
                    ? AppColors.primaryDark
                    : Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: index == currentindex
                      ? AppColors.primaryDark
                      : AppColors.darkGreyDark,
                )),
            child: Text(
              title,
              style: AppTextStyle.textSmall.copyWith(
                color: index == currentindex
                    ? Colors.white
                    : AppColors.darkGreyDark,
              ),
            ),
          ),
        );

    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: genreVideo.length,
      itemBuilder: (context, index) => SizedBox(
        height: 46.0,
        child: index == 0
            ? Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: _genreItemContainer(
                  index,
                  genreVideo[index].title,
                ),
              )
            : _genreItemContainer(
                index,
                genreVideo[index].title,
              ),
      ),
    );
  }
}
