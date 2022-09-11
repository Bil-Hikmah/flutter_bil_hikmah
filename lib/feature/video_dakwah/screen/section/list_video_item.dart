import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/dummy_video_item.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class ListVideoItem extends StatelessWidget {
  const ListVideoItem(this.listVideo, this.onTap, {Key? key}) : super(key: key);

  final List<DummyVideoItem> listVideo;
  final void Function(DummyVideoItem item) onTap;

  @override
  Widget build(BuildContext context) {
    Widget _videoBanner() => Container(
          height: 147.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.primaryDark,
          ),
        );

    Widget _videoTitle(String title) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: AppTextStyle.textSmall.copyWith(
              color: AppColors.darkGreyDarkest,
              fontWeight: FontWeight.w600,
            ),
          ),
        );

    Widget _videoInformation(
      String type,
      int countView,
      DateTime date,
    ) =>
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                type,
                style: AppTextStyle.textExtraSmall.copyWith(
                  color: AppColors.darkGreyLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8.0),
              const Icon(
                Icons.circle,
                color: AppColors.darkGreyLight,
                size: 4.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                '$countView views',
                style: AppTextStyle.textExtraSmall.copyWith(
                  color: AppColors.darkGreyLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8.0),
              const Icon(
                Icons.circle,
                color: AppColors.darkGreyLight,
                size: 4.0,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  '${date.day} ${date.month} ${date.year}',
                  textAlign: TextAlign.left,
                  style: AppTextStyle.textExtraSmall.copyWith(
                    color: AppColors.darkGreyLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );

    Widget _videoItem(DummyVideoItem item) => InkWell(
          onTap: () {
            onTap(item);
          },
          child: Container(
            margin: const EdgeInsets.only(
              bottom: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _videoBanner(),
                const SizedBox(height: 8.0),
                _videoTitle(item.title),
                const SizedBox(height: 4.0),
                _videoInformation(
                  item.genreVideo,
                  item.countView,
                  item.date,
                ),
              ],
            ),
          ),
        );

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listVideo.length,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemBuilder: (context, index) => _videoItem(listVideo[index]),
    );
  }
}