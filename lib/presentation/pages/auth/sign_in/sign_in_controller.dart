import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:teka_3dclic/main.dart';
import 'package:teka_3dclic/manager/hive_manager.dart';
import 'package:teka_3dclic/models/user_session_model.dart';
import 'package:teka_3dclic/presentation/routes/app_pages.dart';
import 'package:teka_3dclic/services/auth_services.dart';

class SignInController extends GetxController {
  //Variables
  //Global Form key for validations
  final formKey = GlobalKey<FormState>();
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxBool loadingAuth = false.obs;
  final RxBool loadingRedirecting = false.obs;
  late final StreamSubscription<AuthState> authStateSubscription;
  AuthServices authServices = AuthServices();

  @override
  void onInit() {
    super.onInit();
    userSession();
  }

  //Functions to signUp an user in supabase service
  //This checks if user has session or not
  Future<void> userSession() async {
    authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (loadingRedirecting.value) return;
      final session = data.session;
      if (session != null) {
        loadingRedirecting.value = true;
        Get.toNamed(AppRoutes.homeScreen);
      }
    });
  }

  //This create a new user
  Future<void> signIn() async {
    try {
      loadingAuth.value = true;

      //Check If email already exist and return
      final response = await authServices.checkEmailExists(email.value);
      if (response == false) {
        Get.snackbar('Error', 'Email does not exists. Try with another email',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        return;
      }

      final responseSignIn =
          await authServices.signIn(email: email.value, pwd: password.value);

      if (responseSignIn.statusCode != 200) return;

      final userModel = UserModelSession.fromJson(responseSignIn.data);

      hiveManager.token = userModel.accessToken;
      hiveManager.user?.id = userModel.user.id;

      Get.snackbar('Success', 'Welcome to 3D Clic',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      Get.toNamed(AppRoutes.homeScreen);

      loadingAuth.value = false;
    } on AuthException catch (error) {
      Get.snackbar('Error', error.message,
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingAuth.value = false;
    } catch (error) {
      Get.snackbar('Error', 'Unexpected error ocurred:$error',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingAuth.value = false;
    }
  }

  ///validations
  //Email validations
  validateEmail(String? email) {
    if (GetUtils.isNullOrBlank(email ?? '') == true) {
      return 'Email cannot be empty';
    } else if (!GetUtils.isEmail(email!)) {
      return 'Email is not valid';
    }
    return null;
  }

  //Password validations
  validatePass(String? pwd) {
    if (GetUtils.isNullOrBlank(pwd ?? '') == true) {
      return 'Password cannot be empty';
    } else if (!GetUtils.isLengthGreaterThan(pwd, 5)) {
      return 'Password cannot be less than 6 characters';
    }
    return null;
  }

  Future onLogin() async {
    if (formKey.currentState!.validate()) {
      return;
    } else {
      Get.snackbar(
          'Error', 'Please check inputs. Email or password are incorrect',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
    }
  }
}
