import 'package:flutter/material.dart';
import 'package:flutter_bil_hikmah/feature/login/logic/login_cubit.dart';
import 'package:flutter_bil_hikmah/feature/onboard/repository/onboard_item.dart';
import 'package:flutter_bil_hikmah/feature/onboard/screen/section/onboard_action_button.dart';
import 'package:flutter_bil_hikmah/feature/onboard/screen/section/onboard_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

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
        body: ProgressHUD(
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              final progress = ProgressHUD.of(context);
              if (state.status == LoginStatus.loading) {
                progress?.show();
              }
            },
            child: SafeArea(
              child: Stack(
                children: [
                  OnboardContent(
                    _pageController,
                    (page) {
                      setState(() {
                        _scrollIndex = page;
                      });
                    },
                    dummyOnboard,
                  ),
                  OnboardActionButton(
                    dummyOnboard.length,
                    _scrollIndex,
                    () {
                      _pageController.jumpToPage(dummyOnboard.length - 1);
                      setState(() {
                        _scrollIndex = dummyOnboard.length - 1;
                      });
                    },
                    () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                      setState(() {
                        _scrollIndex++;
                      });
                    },
                    () {
                      context.read<LoginCubit>().signInWithGoogle();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
