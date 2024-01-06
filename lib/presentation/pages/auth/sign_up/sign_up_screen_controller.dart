import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:teka_3dclic/main.dart';
import 'package:teka_3dclic/presentation/routes/app_pages.dart';
import 'package:teka_3dclic/services/auth_services.dart';

class SignUpController extends GetxController {
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
    signUpSession();
  }

  @override
  void dispose() {
    authStateSubscription.cancel();
    super.dispose();
  }

  //Functions to signUp an user in supabase service
  //This checks if user has session or not
  Future<void> signUpSession() async {
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
  Future<void> signUp() async {
    try {
      loadingAuth.value = true;

      final response = await authServices.checkEmailExists(email.value);

      //Check If email already exist and return
      if (response == true) {
        Get.snackbar('Error', 'Email already taken. Try with another email',
            duration: const Duration(seconds: 4),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
        return;
      }

      await supabase.auth.signUp(
          email: email.value,
          password: password.value,
          emailRedirectTo: kIsWeb
              ? null
              : 'io.supabase.flutterquickstart://login-callback/');
      supabase.auth.headers;

      Get.snackbar('Success',
          'Please check your email. We send you a link to activate your account.',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingAuth.value = false;
    } on AuthException catch (error) {
      Get.snackbar('Error', error.message,
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.blueAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

      loadingAuth.value = false;
    } catch (error) {
      Get.snackbar('Error', 'Unexpected error ocurred',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.blueAccent,
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
      /*Get.snackbar('Success',
          'Please check your email. We send you a link to activate your account.',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);*/

      return;
    } else {
      Get.snackbar(
          'Error', 'Please check inputs. Email or password are incorrect',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.blueAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
    }
  }
}
