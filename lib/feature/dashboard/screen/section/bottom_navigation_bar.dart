import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/common/constant/url_asset.dart';
import 'package:flutter_bil_hikmah/feature/dashboard/screen/section/navigation_item.dart';

class DashboardBottomNavigationBar extends StatelessWidget {
  const DashboardBottomNavigationBar(
    this.currentIndex,
    this.onTap, {
    Key? key,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        margin: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationItem(
              () {
                onTap(0);
              },
              currentIndex == 0,
              UrlAsset.home,
              "Home",
            ),
            NavigationItem(
              () {
                onTap(1);
              },
              currentIndex == 1,
              UrlAsset.video,
              "Video",
            ),
            NavigationItem(
              () {
                onTap(2);
              },
              currentIndex == 2,
              UrlAsset.quran,
              "Qur'an",
            ),
            NavigationItem(
              () {
                onTap(3);
              },
              currentIndex == 3,
              UrlAsset.profile,
              "Profile",
            )
          ],
        ),
      ),
      color: Colors.white,
    );
  }
}
