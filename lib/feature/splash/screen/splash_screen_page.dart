import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/config/routes/route_name.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late Duration _duration;

  void _startTimer() {
    Timer(_duration, () {
      Navigator.pushReplacementNamed(context, Routes.onboarding);
    });
  }

  @override
  initState() {
    super.initState();
    _duration = const Duration(seconds: 3);
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          UrlAsset.logo,
        ),
      ),
    );
  }
}
