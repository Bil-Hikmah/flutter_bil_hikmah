import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bil_hikmah/widget/misc/webview_page.dart';

class DefaultDetailPage extends StatelessWidget {
  const DefaultDetailPage(
    this.title,
    this.webURL, {
    Key? key,
  }) : super(key: key);

  static Route route(
    String title,
    String webURL,
  ) =>
      MaterialPageRoute(
        builder: (_) => DefaultDetailPage(
          title,
          webURL,
        ),
      );

  final String title;
  final String webURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: title,
      ),
      body: WebviewPage(
        title: title,
        link: webURL,
      ),
    );
  }
}
