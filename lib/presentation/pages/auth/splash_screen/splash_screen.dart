import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teka_3dclic/presentation/pages/auth/splash_screen/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(builder: (_) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: CircularProgressIndicator(),
            ),
            Obx(() {
              return AnimatedCrossFade(
                crossFadeState: _.visibility.value
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: Image.asset(
                  'assets/images/branding_tekaclic.png',
                  height: 200,
                  width: 200,
                ),
                secondChild: const SizedBox(),
                duration: 250.milliseconds,
              );
            })
          ],
        ),
      );
    });
  }
}
