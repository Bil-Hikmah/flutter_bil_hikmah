import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bil_hikmah/feature/al_quran/screen/al_quran_page.dart';
import 'package:flutter_bil_hikmah/feature/dashboard/screen/section/bottom_navigation_bar.dart';
import 'package:flutter_bil_hikmah/feature/home/screen/home_page.dart';
import 'package:flutter_bil_hikmah/feature/profile/screen/profile_page.dart';
import 'package:flutter_bil_hikmah/feature/video_dakwah/screen/video_dakwah_page.dart';
import 'package:flutter_bil_hikmah/style/colors.dart';
import 'package:flutter_bil_hikmah/style/text.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DateTime preBackpress = DateTime.now();

  final List<Widget> currentScrenList = [
    const HomePage(),
    const VideoDakwahPage(),
    const AlQuranPage(),
    const ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(preBackpress) >=
            const Duration(seconds: 2)) {
          preBackpress = DateTime.now();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar
            ..showSnackBar(
              SnackBar(
                content: Text(
                  'Tekan lagi untuk keluar',
                  style: AppTextStyle.textMedium.copyWith(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: AppColors.secondaryLight,
              ),
            );
          return false;
        } else {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PageStorage(
            bucket: bucket,
            child: currentScrenList[currentIndex],
          ),
          bottomNavigationBar: DashboardBottomNavigationBar(
            currentIndex,
            (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
