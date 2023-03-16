import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/about/screen/about_page.dart';
import 'package:flutter_bil_hikmah/feature/faq/screen/faq_page.dart';
import 'package:flutter_bil_hikmah/feature/feedback/screen/feedback_page.dart';
import 'package:flutter_bil_hikmah/feature/live_chat/screen/live_chat_page.dart';

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
      icon: Icons.settings,
      title: "Pengaturan",
      route: () {},
    ),
    ProfileItemAction(
      icon: Icons.info_outline,
      title: "Tentang Aplikasi",
      route: () {
        Navigator.of(context).push(AboutPage.route());
      },
    ),
    ProfileItemAction(
      icon: Icons.help_outline_rounded,
      title: "Bantuan",
      route: () {
        Navigator.of(context).push(FAQPage.route());
      },
    ),
    ProfileItemAction(
      icon: Icons.message_rounded,
      title: "Live Chat",
      route: () {
        Navigator.of(context).push(LiveChatPage.route());
      },
    ),
    ProfileItemAction(
      icon: Icons.star_rate_outlined,
      title: "Masukan",
      route: () {
        Navigator.of(context).push(FeedbackPage.route());
      },
    ),
    ProfileItemAction(
      icon: Icons.privacy_tip_outlined,
      title: "Kebijakan Privasi",
      route: () {},
    ),
  ];

  return listItem;
}
