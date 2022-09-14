import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/favorite/screen/favorite_page.dart';

class ProfileItemAction {
  final IconData icon;
  final String title;
  final void Function() route;

  ProfileItemAction({
    required this.icon,
    required this.title,
    required this.route,
  });
}

List<ProfileItemAction> listProfileItemAction(BuildContext context) {
  final List<ProfileItemAction> listItem = [
    ProfileItemAction(
      icon: Icons.favorite_border,
      title: "Favorit",
      route: () {
        Navigator.of(context).push(FavoritePage.route());
      },
    ),
    ProfileItemAction(
      icon: Icons.info_outline,
      title: "Tentang Aplikasi",
      route: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Container()));
      },
    ),
    ProfileItemAction(
      icon: Icons.settings,
      title: "Pengaturan",
      route: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Container()));
      },
    ),
    ProfileItemAction(
      icon: Icons.notes_rounded,
      title: "Syarat & Ketentuan",
      route: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Container()));
      },
    ),
    ProfileItemAction(
      icon: Icons.help_outline_rounded,
      title: "Bantuan",
      route: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Container()));
      },
    ),
    ProfileItemAction(
      icon: Icons.privacy_tip_outlined,
      title: "Kebijakan Privasi",
      route: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Container()));
      },
    ),
    ProfileItemAction(
      icon: Icons.star_rate_outlined,
      title: "Rating",
      route: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Container()));
      },
    ),
  ];

  return listItem;
}
