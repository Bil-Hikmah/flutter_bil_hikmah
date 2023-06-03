import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/admin/logic/admin_cubit.dart';
import 'package:flutter_bil_hikmah/feature/admin/screen/amalan_sunnah_admin/amalan_sunnah_admin_view.dart';
import 'package:flutter_bil_hikmah/feature/profile/domain/model/profile_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<ProfileItemAction> adminAction(BuildContext context) => [
      ProfileItemAction(
        icon: Icons.admin_panel_settings_outlined,
        title: "Amalan Sunnah",
        route: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (newContext) {
            return BlocProvider.value(
              value: BlocProvider.of<AdminCubit>(context),
              child: const AmalanSunnahAdminView(),
            );
          }));
        },
      ),
      ProfileItemAction(
        icon: Icons.admin_panel_settings_outlined,
        title: "Bahasa Isyarat",
        route: () {
          // Navigator.push(context, SettingsPage.route());
        },
      ),
      ProfileItemAction(
        icon: Icons.admin_panel_settings_outlined,
        title: "Game Isyarat",
        route: () {
          // Navigator.push(context, SettingsPage.route());
        },
      ),
      ProfileItemAction(
        icon: Icons.admin_panel_settings_outlined,
        title: "Poster Dakwah",
        route: () {
          // Navigator.push(context, SettingsPage.route());
        },
      ),
      ProfileItemAction(
        icon: Icons.admin_panel_settings_outlined,
        title: "Al-Qur'an Bahasa Isyarat",
        route: () {
          // Navigator.push(context, SettingsPage.route());
        },
      ),
      ProfileItemAction(
        icon: Icons.admin_panel_settings_outlined,
        title: "Video Dakwah",
        route: () {
          // Navigator.push(context, SettingsPage.route());
        },
      ),
    ];
