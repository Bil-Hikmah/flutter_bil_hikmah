import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/favorite/screen/section/favorite_view.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (_) => const FavoritePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: "Favorit"),
      body: const FavoriteView(),
    );
  }
}
