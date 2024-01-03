import 'package:get/get.dart';
import 'package:teka_3dclic/presentation/pages/screens.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    //Onboarding screen
    GetPage(
        name: AppRoutes.onboarding,
        page: () => const OnboardingScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => const OnboardingScreen());
        })),

    //Home screen
    GetPage(
        name: AppRoutes.home,
        page: () => const HomeScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => const HomeScreen());
        }))
  ];
}
