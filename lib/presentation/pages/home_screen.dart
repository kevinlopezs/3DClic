import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teka_3dclic/presentation/dummy_data/app_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  static const cards = <Map<String, dynamic>>[];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  final PageController _pageViewController = PageController(initialPage: 0);

  bool isMounted = true;

  //const homeMenu = cards;
  @override
  void initState() {
    super.initState();
    if (!isMounted) return;
    _initTimer();

    if (mounted) {
      _pageViewController.addListener(() {
        setState(() {});
      });

      // TODO: implement initState
    }
  }

  @override
  void dispose() {
    Timer.periodic(const Duration(seconds: 1), (timer) {}).cancel();
    _pageViewController.dispose();
    isMounted = false;
    super.dispose();
  }

  //Start timer for page view auto slide
  void _initTimer() {
    if (isMounted == true) {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        if (_currentPage < 1) {
          _currentPage++;
          if (!isMounted) return;
          setState(() {});
        } else {
          _currentPage = 0;
          if (!isMounted) return;
          setState(() {});
        }

        //Without this animation not working
        _pageViewController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInCubic,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final fonts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi Kevin',
                  style: fonts.bodySmall,
                ),
                RotatedBox(
                  quarterTurns: 135,
                  child: Icon(
                    Icons.bar_chart_rounded,
                    color: colors.primary,
                    size: 28,
                  ),
                )
              ],
            ),
            Expanded(
                child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: size.width * 0.5,
                  //width: size.width * 0.4,
                  child: PageView(
                    controller: _pageViewController,
                    onPageChanged: (value) => _currentPage = value,
                    children: [
                      Center(
                        child: Image.asset(
                          width: size.width * 0.5,
                          'assets/images/3d_modeling_amico.png',
                          scale: 1.2,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          width: size.width * 0.5,
                          'assets/images/3d_modeling_rafiki.png',
                          scale: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,

                Text(
                  'Menu',
                  style: fonts.titleMedium,
                ),
                10.verticalSpace,
                //This is method for map screen of cards
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: size.width * 0.1,
                  runSpacing: size.width * 0.05,
                  children: appMenus
                      .map((slideData) => _cardMenu(
                          onTap: () {
                            //context.push(slideData.link);
                            Get.toNamed(slideData.link);
                          },
                          title: slideData.title,
                          icon: slideData.icon,
                          assetHeight: size.height * 0.08))
                      .toList(),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _cardMenu(
      {required String title,
      required String icon,
      VoidCallback? onTap,
      Color color = Colors.white,
      Color fontColor = Colors.grey,
      double assetHeight = 60.0}) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 20,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          width: 120,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(24)),
          child: Center(
            child: Column(
              children: [
                Image.asset(icon, height: assetHeight),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: fontColor),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
