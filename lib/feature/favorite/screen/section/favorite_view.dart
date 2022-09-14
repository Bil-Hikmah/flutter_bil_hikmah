import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/favorite/domain/model/favorit_item.dart';
import 'package:flutter_bil_hikmah/widget/field/default_card_item.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: listFavoriteItem(context).length,
      itemBuilder: (context, index) {
        return index == 0
            ? Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: defaultItemCard(
                  listFavoriteItem(context)[index].title,
                  listFavoriteItem(context)[index].route,
                ),
              )
            : defaultItemCard(
                listFavoriteItem(context)[index].title,
                listFavoriteItem(context)[index].route,
              );
      },
    );
  }
}
