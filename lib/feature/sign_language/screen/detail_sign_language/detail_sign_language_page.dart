import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/domain/models/sign_language_response.dart';
import 'package:flutter_bil_hikmah/feature/sign_language/screen/detail_sign_language/section/detail_sign_language_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:permission_handler/permission_handler.dart';

class DetailSignLanguagePage extends StatefulWidget {
  const DetailSignLanguagePage(this.headerTitle, this.data, {Key? key})
      : super(key: key);

  final String headerTitle;
  final List<SignLanguageDetail> data;

  static Route route(
    String headerTitle,
    List<SignLanguageDetail> data,
  ) =>
      MaterialPageRoute(
        builder: (_) => DetailSignLanguagePage(
          headerTitle,
          data,
        ),
      );

  @override
  State<DetailSignLanguagePage> createState() => _DetailSignLanguagePageState();
}

class _DetailSignLanguagePageState extends State<DetailSignLanguagePage> {
  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }

  @override
  void initState() {
    _requestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: "Bahasa Isyarat"),
      body: DetailSignLangugeView(
        widget.headerTitle,
        widget.data,
      ),
    );
  }
}
