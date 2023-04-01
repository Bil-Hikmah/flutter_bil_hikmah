import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/theme_mode/logic/cubit/theme_mode_cubit.dart';
import 'package:flutter_bil_hikmah/style/text.dart';
import 'package:flutter_bil_hikmah/widget/field/default_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const SettingsPage(),
      settings: const RouteSettings(name: "/settings"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.25);
        }
        return null;
      },
    );

    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }

        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }

        return null;
      },
    );

    Widget themeSettings() {
      return BlocBuilder<ThemeModeCubit, ThemeModeState>(
        builder: (context, state) {
          return Row(
            children: [
              const Expanded(child: AppTextMediumPrimary("Mode Tema")),
              Switch.adaptive(
                activeThumbImage: const AssetImage("assets/icons/sun_icon.png"),
                inactiveThumbImage:
                    const AssetImage("assets/icons/moon_icon.png"),
                trackColor: trackColor,
                overlayColor: overlayColor,
                value: state.themeMode == ThemeMode.light,
                onChanged: (bool value) {
                  context.read<ThemeModeCubit>().setThemeMode(
                        value ? ThemeMode.light : ThemeMode.dark,
                      );
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "Pengaturan",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24.0,
        ),
        children: [
          themeSettings(),
        ],
      ),
    );
  }
}
