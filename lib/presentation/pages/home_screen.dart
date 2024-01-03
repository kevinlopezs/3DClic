import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teka_3dclic/presentation/dummy_data/app_menu.dart';

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
    if (!isMounted) return;

    if (mounted) {
      _pageViewController.addListener(() {
        setState(() {});
      });

      // TODO: implement initState

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

    super.initState();
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
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Inicio',
                  style: fonts.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                //This is method for map screen of cards
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: size.width * 0.1,
                  runSpacing: size.width * 0.05,
                  children: appMenus
                      .map((slideData) => _cardMenu(
                          onTap: () {
                            context.push(slideData.link);
                          },
                          title: slideData.title,
                          icon: slideData.icon,
                          assetHeight: size.height * 0.08))
                      .toList(),
                  /*...homeMenu.map(
                      (card) => _cardMenu(
                          title: card['title'],
                          icon: card['icon'],
                          assetHeight: size.height * 0.08),
                    ),
                    ...homeMenu.map(
                      (card) => _cardMenu(
                          title: card['title2'],
                          icon: card['icon2'],
                          assetHeight: size.height * 0.08),
                    ),
                    ...homeMenu.map(
                      (card) => _cardMenu(
                          title: card['title3'],
                          icon: card['icon3'],
                          assetHeight: size.height * 0.08),
                    ),

                    /* _cardMenu(
                        title: homeMenu[0].title,
                        icon: homeMenu[0].icon,
                        assetHeight: size.height * 0.08),
                    _cardMenu(
                      title: homeMenu[1].title,
                      icon: homeMenu[1].icon,
                      assetHeight: size.height * 0.08,
                    ),
                    _cardMenu(
                      title: homeMenu[2].title,
                      icon: homeMenu[2].icon,
                      assetHeight: size.height * 0.08,
                    )*/
                    */
                  /*ListView.builder(itemBuilder: ((context, index) {
                      final homeMenu = appMenus[index];
                      return ListTile(
                        title: Text(homeMenu.title),
                        subtitle: Text(homeMenu.title),
                        leading: const Icon(Icons.adf_scanner),
                      );
                    }))*/
                )
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
