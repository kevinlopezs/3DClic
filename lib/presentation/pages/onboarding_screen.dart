import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teka_3dclic/presentation/routes/app_pages.dart';
import '../dummy_data/onboarding_data.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff7f6fb),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: _WelcomeContent(),
        )));
  }
}

class _WelcomeContent extends StatefulWidget {
  const _WelcomeContent();

  @override
  State<_WelcomeContent> createState() => _WelcomeContentState();
}

class _WelcomeContentState extends State<_WelcomeContent> {
  final _totalDots = slidesIntroTutorial.length;
  int _currentPage = 0;
  final PageController _pageViewController = PageController(initialPage: 0);

  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    if (!isMounted) return;

    if (mounted) {
      _pageViewController.addListener(() {
        setState(() {
          isMounted = true;
        });
      });

      // TODO: implement initState

      Timer.periodic(const Duration(seconds: 5), (timer) {
        if (_currentPage < 1 && isMounted) {
          _currentPage++;
          if (!isMounted) return; //This solve crash screen mounted
          setState(() {});
        } else {
          _currentPage = 0;
          if (!isMounted) return;
          setState(() {});
        }

        _pageViewController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInCubic,
        );
      });
    } //THIS IS VERY IMPORTANT TO UPDATE PAGE VIEW CONTROLLER
  }

  @override
  void dispose() {
    Timer.periodic(const Duration(seconds: 1), (timer) {}).cancel();
    _pageViewController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Instance for apptheme
    final colors = Theme.of(context).colorScheme;
    final fonts = Theme.of(context).textTheme;

    return Column(
      children: [
        // PageView Load a Lottie file from your assets
        Expanded(
          child: SizedBox(
              height: 450,
              width: 500,
              child: PageView(
                onPageChanged: (value) => _currentPage = value,
                controller: _pageViewController,
                children: slidesIntroTutorial
                    .map((slideData) => _Slides(
                          title: slideData.title,
                          caption: slideData.caption,
                          assetUrl: slideData.assetUrl,
                          dot: slideData.dot.toString(),
                        ))
                    .toList(),
              )),
        ),
        const SizedBox(
          height: 18,
        ),
        DotsIndicator(
          dotsCount: _totalDots,
          position: _currentPage,
        ),

        const SizedBox(
          height: 25,
        ),

        //Sign up button
        SizedBox(
          width: double.infinity,
          child: FilledButton(
              style: ButtonStyle(
                  foregroundColor:
                      const MaterialStatePropertyAll<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(colors.primary),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0)))),
              onPressed: () {
                //Action to go sign up screen
                Get.toNamed(AppRoutes.signUpScreen);
              },
              child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    'Sign up',
                    style: fonts.labelLarge,
                  ))),
        ),

        const SizedBox(
          height: 10,
        ),

        //Login button
        SizedBox(
          width: double.infinity,
          child: FilledButton(
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(10),
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => colors.primaryContainer),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(colors.primary),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)))),
              onPressed: () {
                Get.toNamed(AppRoutes.signInScreen);
              },
              child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 16),
                  ))),
        ),
      ],
    );
  }
}

//This is a class for
class _Slides extends StatelessWidget {
  final String title;
  final String caption;
  final String assetUrl;
  final String dot;

  const _Slides(
      {required this.title,
      required this.caption,
      required this.assetUrl,
      required this.dot});

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;
    final fonts = Theme.of(context).textTheme;

    //Get device size
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(height: size.height * 0.3, assetUrl),
            const SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.center,
              title,
              style: fonts.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              textAlign: TextAlign.center,
              caption,
              style: fonts.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
