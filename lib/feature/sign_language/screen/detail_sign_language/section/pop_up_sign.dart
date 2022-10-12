import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/field/bottom_sheet.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

enum Action {
  screenShot,
  share,
}

extension ActionX on Action {
  String get title {
    switch (this) {
      case Action.screenShot:
        return "Simpan";
      case Action.share:
        return "Bagikan";
    }
  }

  bool get isScreenshot => this == Action.screenShot;
}

class PopUpSign extends StatelessWidget {
  PopUpSign(this.title, this.urlImage, this.onTap, {Key? key})
      : super(key: key);

  final String title;
  final String urlImage;
  final void Function() onTap;

  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(
    BuildContext context,
  ) {
    Widget _actionPopUpSignLanguage(Action action) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () async {
                switch (action) {
                  case Action.share:
                    showShareBottomSheet(
                      context,
                      screenshotController: screenshotController,
                    );
                    break;
                  case Action.screenShot:
                    await screenshotController.capture().then((image) async {
                      ImageGallerySaver.saveImage(
                        image!,
                        quality: 100,
                        name: 'Coinsleek',
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
                    break;
                  default:
                    showShareBottomSheet(
                      context,
                      screenshotController: screenshotController,
                    );
                    break;
                }
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.lightGreyLight.withOpacity(0.4),
                ),
                child: Icon(
                  action.isScreenshot ? Icons.download : Icons.share_outlined,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              action.title,
              style: AppTextStyle.textExtraLarge.copyWith(
                color: Colors.white,
              ),
            )
          ],
        );

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.darkGreyDark.withOpacity(0.75),
            child: null,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              width: 238.0,
              height: 350.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38.0),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Screenshot(
                    controller: screenshotController,
                    child: Container(
                      width: 190.0,
                      height: 190.0,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryLight,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                        imageUrl: urlImage,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                            color: AppColors.primaryDark,
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        title,
                        softWrap: true,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.textExtraLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _actionPopUpSignLanguage(Action.screenShot),
                  _actionPopUpSignLanguage(Action.share),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
