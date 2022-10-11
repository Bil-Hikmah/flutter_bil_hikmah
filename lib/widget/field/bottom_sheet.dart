import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:screenshot/screenshot.dart';

Future<T?> showShareBottomSheet<T>(
  BuildContext context, {
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

  Future<void> onTap(FlutterShareMe shareMe) async {
    switch (this) {
      case ShareSocialType.whatsapp:
        return shareMe
            .shareToWhatsApp(msg: "Hello")
            .then((value) => debugPrint(value));
      case ShareSocialType.twitter:
        return shareMe
            .shareToTwitter(msg: "Hello")
            .then((value) => debugPrint(value));
      case ShareSocialType.telegram:
        return shareMe
            .shareToTelegram(msg: "Hello")
            .then((value) => debugPrint(value));
      case ShareSocialType.more:
        return shareMe
            .shareToSystem(msg: "Hello")
            .then((value) => debugPrint(value));
    }
  }
}

List<Map<String, Object>> shareSocialMedia = [
  {
    'title': ShareSocialType.twitter,
    'icon': 'assets/icons/twitter.png',
  },
  {
    'title': ShareSocialType.telegram,
    'icon': 'assets/icons/telegram.png',
  },
  {
    'title': ShareSocialType.whatsapp,
    'icon': 'assets/icons/whatsapp.png',
  },
  {
    'title': ShareSocialType.more,
    'icon': 'assets/icons/more.png',
  }
];

Widget bottomSheetContainer(
  BuildContext context,
) {
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
          () async {
            final FlutterShareMe shareMe = FlutterShareMe();
            await (shareSocialMedia[index]["title"] as ShareSocialType)
                .onTap(shareMe);
          },
        );
      },
    ),
  );
}

Widget itemBottomSheet(String title, void Function() onTap) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey[200],
            ),
          ),
        ),
      ),
      const SizedBox(height: 4.0),
      Text(title),
    ],
  );
}
