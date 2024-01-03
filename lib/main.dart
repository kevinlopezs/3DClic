import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teka_3dclic/presentation/controllers/home_controller.dart';
import 'package:teka_3dclic/presentation/routes/app_pages.dart';
import 'package:teka_3dclic/config/theme/app_theme.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  //This is for splashscreen

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.onboarding,
      theme: AppTheme(
        selectedColor: 6,
        selectedFont: 1,
      ).getTheme(),
      initialBinding: BindingsBuilder(() {
        Get.put<HomeController>(HomeController());
      }),
    );
  }
}
