import 'package:get/get.dart';
import 'package:teka_3dclic/main.dart';
import 'package:teka_3dclic/manager/hive_manager.dart';
import 'package:teka_3dclic/presentation/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  RxBool visibility = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(50.milliseconds, () => visibility.value = true);
    Future.delayed(500.milliseconds, () {
      _redirect();
    });
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    final session = supabase.auth.currentSession;
    if (session != null || hiveManager.token != null) {
      Get.toNamed(AppRoutes.homeScreen);
    } else {
      Get.toNamed(AppRoutes.onboardingScreen);
    }
  }
}
