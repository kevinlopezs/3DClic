import 'package:get/get.dart';
import 'package:teka_3dclic/presentation/pages/screens.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    //Onboarding screen
    GetPage(
        name: AppRoutes.onboardingScreen,
        page: () => const OnboardingScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => const OnboardingScreen());
        })),

    //Auth screens//
    //SignUp screen
    GetPage(
        name: AppRoutes.signUpScreen,
        page: () => const SignUp(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => const SignUp());
        })),

    //SignUp Verification screen
    GetPage(
        name: AppRoutes.signUpVerificationScreen,
        page: () => const SignUpVerification(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => const SignUpVerification());
        })),

    //SignIn screen
    GetPage(
        name: AppRoutes.signInScreen,
        page: () => const SignIn(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => const SignIn());
        })),

    //Home screen
    GetPage(
        name: AppRoutes.homeScreen,
        page: () => const HomeScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => const HomeScreen());
        })),

    //Calculator screen
    GetPage(
        name: AppRoutes.calculatorScreen,
        page: () => const CalculatorScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => const CalculatorScreen());
        })),

    //Invoice screen
    GetPage(
        name: AppRoutes.invoiceScreen,
        page: () => const InvoiceScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => const InvoiceScreen());
        })),

    //Models3D screen
    GetPage(
        name: AppRoutes.models3DScreen,
        page: () => const Models3dScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => const Models3dScreen());
        })),
  ];
}
