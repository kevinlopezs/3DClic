import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teka_3dclic/models/user_model.dart';
import 'package:teka_3dclic/presentation/global_controllers/home_controller.dart';
import 'package:teka_3dclic/presentation/pages/auth/splash_screen/splash_screen_controller.dart';
import 'package:teka_3dclic/presentation/routes/app_pages.dart';
import 'package:teka_3dclic/config/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  //not ok
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  if (!Hive.isBoxOpen("user")) await Hive.openBox<UserModel>("user");
  if (!Hive.isBoxOpen("auth")) await Hive.openBox("auth");
  await Supabase.initialize(
    url: dotenv.env['API_URL']!,
    anonKey: dotenv.env['API_KEY']!,
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
