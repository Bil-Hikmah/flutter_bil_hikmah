import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/domain/models/list_detail_sign_dummy.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/screen/detail_sign_language/section/detail_sign_language_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class DetailSignLanguagePage extends StatelessWidget {
  const DetailSignLanguagePage(this.headerTitle, this.id, {Key? key})
      : super(key: key);

  final String headerTitle;
  final int id;

  static Route route(
    String headerTitle,
    int id,
  ) =>
      MaterialPageRoute(
        builder: (_) => DetailSignLanguagePage(
          headerTitle,
          id,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: "Bahasa Isyarat"),
      body: DetailSignLangugeView(
        headerTitle,
        detailSignDummy[id],
      ),
    );
  }
}
