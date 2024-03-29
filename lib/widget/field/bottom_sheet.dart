import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

Future<T?> showShareBottomSheet<T>(
  BuildContext context,
  String message, {
  ScreenshotController? screenshotController,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.0),
      ),
    ),
    barrierColor: Colors.black.withOpacity(0.3),
    builder: (BuildContext context) {
      return bottomSheetContainer(
        context,
        message,
        screenshotController: screenshotController,
      );
    },
  );
}

enum ShareSocialType {
  whatsapp,
  twitter,
  telegram,
  more,
}

extension ShareSocialTypeX on ShareSocialType {
  String get title {
    switch (this) {
      case ShareSocialType.whatsapp:
        return "WhatsApp";
      case ShareSocialType.twitter:
        return "Twitter";
      case ShareSocialType.telegram:
        return "Telegram";
      case ShareSocialType.more:
        return "Lainnya";
    }
  }

  Future<void> onTap(
    FlutterShareMe shareMe,
    String message, {
    ScreenshotController? screenshotController,
  }) async {
    switch (this) {
      case ShareSocialType.whatsapp:
        return screenshotController != null
            ? await screenshotController.capture().then((image) async {
                final directory = await getApplicationDocumentsDirectory();
                final file = await File('${directory.path}/temp.png').create();
                await file.writeAsBytes(image!);

                shareMe
                    .shareToWhatsApp(msg: message, imagePath: file.path)
                    .then((value) => debugPrint(value));
              })
            : shareMe
                .shareToWhatsApp(msg: message)
                .then((value) => debugPrint(value));
      case ShareSocialType.twitter:
        return shareMe
            .shareToTwitter(msg: message)
            .then((value) => debugPrint(value));
      case ShareSocialType.telegram:
        return shareMe
            .shareToTelegram(msg: message)
            .then((value) => debugPrint(value));
      case ShareSocialType.more:
        return shareMe
            .shareToSystem(msg: message)
            .then((value) => debugPrint(value));
    }
  }
}

List<Map<String, Object>> shareSocialMedia = [
  {
    'title': ShareSocialType.twitter,
    'icon': UrlAsset.twitterIcon,
  },
  {
    'title': ShareSocialType.telegram,
    'icon': UrlAsset.telegramIcon,
  },
  {
    'title': ShareSocialType.whatsapp,
    'icon': UrlAsset.whatsappIcon,
  },
  {
    'title': ShareSocialType.more,
    'icon': UrlAsset.more,
  }
];

Widget bottomSheetContainer(
  BuildContext context,
  String message, {
  ScreenshotController? screenshotController,
}) {
  final FlutterShareMe shareMe = FlutterShareMe();
  return Container(
    height: MediaQuery.of(context).size.height * 0.20,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      color: Colors.white,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
      ),
      itemCount: shareSocialMedia.length,
      itemBuilder: (context, index) {
        return itemBottomSheet(
          (shareSocialMedia[index]["title"] as ShareSocialType).title,
          shareSocialMedia[index]["icon"] as String,
          () async {
            await (shareSocialMedia[index]["title"] as ShareSocialType).onTap(
              shareMe,
              message,
              screenshotController: screenshotController,
            );
          },
        );
      },
    ),
  );
}

Widget itemBottomSheet(
  String title,
  String imageUrl,
  void Function() onTap,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                imageUrl,
              ),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
          ),
        ),
      ),
      const Expanded(child: SizedBox()),
      Text(title),
    ],
  );
}
