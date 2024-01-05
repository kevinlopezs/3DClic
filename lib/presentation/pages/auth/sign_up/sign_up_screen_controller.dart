import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  //Variables
  final RxString email = ''.obs;
  final RxString password = ''.obs;

  //Global Form key for validations
  final formKey = GlobalKey<FormState>();

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
      Get.snackbar('Success',
          'Please check your email. We send you a link to activate your account.',
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);

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
