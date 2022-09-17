import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/default_detail/section/default_detail_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class DefaultDetailPage extends StatelessWidget {
  const DefaultDetailPage(
    this.title,
    this.content, {
    Key? key,
  }) : super(key: key);

  static Route route(
    String title,
    String content,
  ) =>
      MaterialPageRoute(
        builder: (_) => DefaultDetailPage(
          title,
          content,
        ),
      );

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: title,
      ),
      body: DefaultDetailView(
        title,
        content,
      ),
    );
  }
}
