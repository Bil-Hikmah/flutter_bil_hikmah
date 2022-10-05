import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/config/routes/route_name.dart';
import 'package:flutter_bil_hikmah/feature/splash/logic/cubit/init_app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_exception/exception.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InitAppCubit, InitAppState>(
      listener: (context, state) {
        if (state.status.isError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.exception?.errorMessage(context) ?? "Exception Failed",
                ),
              ),
            );
        }
        if (state.status.isSuccess) {
          Timer(const Duration(milliseconds: 1500), () {
            Navigator.pushReplacementNamed(context, Routes.onboarding);
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Image.asset(
              UrlAsset.logo,
            ),
          ),
        );
      },
    );
  }
}
