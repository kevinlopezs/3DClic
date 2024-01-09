import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teka_3dclic/manager/hive_manager.dart';
import 'package:teka_3dclic/presentation/routes/app_pages.dart';
import 'package:teka_3dclic/services/auth_services.dart';

class HomeController extends GetxController {
  AuthServices authServices = AuthServices();

  Future<void> signOut() async {
    final response = await authServices.signOut();

    if (response == 204) {
      Get.snackbar('OK', 'Session closed successfully',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
      hiveManager.signOut();
      Get.offAllNamed(AppRoutes.onboardingScreen);
    }
  }
}
