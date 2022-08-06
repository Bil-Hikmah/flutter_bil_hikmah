import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/onboard/repository/onboard_item.dart';
import 'package:flutter_bil_hikmah/feature/onboard/screen/section/onboard_content.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int _scrollIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_scrollIndex != 0) {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          setState(() {
            _scrollIndex--;
          });
        }
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              OnboardContent(
                _pageController,
                (page) {
                  setState(() {
                    _scrollIndex++;
                  });
                },
                dummyOnboard,
              )
            ],
          ),
        ),
      ),
    );
  }
}
