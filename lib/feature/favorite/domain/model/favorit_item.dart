import 'package:flutter/material.dart';

class FavoriteItem {
  final String title;
  final void Function() route;
  FavoriteItem(this.title, this.route);
}

List<FavoriteItem> listFavoriteItem(BuildContext context) {
  final List<FavoriteItem> listItem = [
    FavoriteItem("Video", () {}),
    FavoriteItem("Poster", () {})
  ];
  return listItem;
}
