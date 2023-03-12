import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/field/bottom_sheet.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class DetailPosterView extends StatefulWidget {
  const DetailPosterView(this.urlImage, {Key? key}) : super(key: key);

  final String urlImage;

  @override
  State<DetailPosterView> createState() => _DetailPosterViewState();
}

class _DetailPosterViewState extends State<DetailPosterView> {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    Widget _image() => Screenshot(
          controller: screenshotController,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
            ),
            child: CachedNetworkImage(
              imageUrl: widget.urlImage,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                  color: AppColors.primaryDark,
                ),
              ),
              fit: BoxFit.cover,
            ),
          ),
        );

    Widget _actionContainer(
      String title,
      IconData icons,
      void Function() onTap,
    ) =>
        InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyLight.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Icon(
                  icons,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: AppTextStyle.textMedium.copyWith(color: Colors.white),
              )
            ],
          ),
        );

    final _action = Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 36.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyLight.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _actionContainer(
                  "Download",
                  Icons.download,
                  () async {
                    await screenshotController.capture().then((image) async {
                      ImageGallerySaver.saveImage(
                        image!,
                        quality: 100,
                        name: 'Coinsleek-123',
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.primaryDark,
                          content: Text(
                            'Gambar berhasil disimpan',
                            style: AppTextStyle.textMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
                _actionContainer(
                  "Share",
                  Icons.share,
                  () {
                    showShareBottomSheet(
                      context,
                      "Hello",
                      screenshotController: screenshotController,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return Stack(
      children: [
        _image(),
        _action,
      ],
    );
  }
}
