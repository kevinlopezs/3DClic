import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teka_3dclic/presentation/controllers/home_controller.dart';
import 'package:teka_3dclic/presentation/pages/auth/splash_screen/splash_screen_controller.dart';
import 'package:teka_3dclic/presentation/routes/app_pages.dart';
import 'package:teka_3dclic/config/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://gxvmkcsgwrglqdrcraqx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd4dm1rY3Nnd3JnbHFkcmNyYXF4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ1NzI4MTEsImV4cCI6MjAyMDE0ODgxMX0.nOhfk8NZ-jeyIhmbrdKsgANGqadqUiqQ7xBLV_h-YNA',
  );
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  //This is for splashscreen

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          initialRoute: AppRoutes.splashScreen,
          theme: AppTheme(
            selectedColor: 6,
            selectedFont: 1,
          ).getTheme(),
          initialBinding: BindingsBuilder(() {
            Get.put<HomeController>(HomeController());
            Get.lazyPut(() => SplashScreenController());
          }),
        );
      },
    );
  }
}
