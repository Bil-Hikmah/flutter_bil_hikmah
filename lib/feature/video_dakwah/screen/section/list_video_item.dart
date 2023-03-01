import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/helper/string_helper.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/repository/video_dakwah_models.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class ListVideoItem extends StatelessWidget {
  const ListVideoItem(this.listVideo, this.onTap, {Key? key}) : super(key: key);

  final List<VideoDakwahModels> listVideo;
  final void Function(VideoDakwahModels item) onTap;

  @override
  Widget build(BuildContext context) {
    Widget _videoBanner(String url) => Container(
          height: 147.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(url.getVideoThumbnail),
              fit: BoxFit.cover,
            ),
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

    Widget _videoItem(VideoDakwahModels item) => InkWell(
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
                _videoBanner(
                    item.videoURL.substring(item.videoURL.length - 11)),
                const SizedBox(height: 8.0),
                _videoTitle(item.title),
                const SizedBox(height: 4.0),
                _videoInformation(
                  item.genre,
                  item.dateCreated,
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
