// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
import 'package:teka_3dclic/presentation/pages/screens.dart';

final appRouter = GoRouter(routes: [
  //Config route for home
  GoRoute(
    path: '/',
    name: OnboardingScreen.name,
    builder: (context, state) => const OnboardingScreen(),
  ),

  //Config route for signup
  GoRoute(
      name: SignUp.name,
      path: '/signup_screen',
      builder: (context, state) => const SignUp()),

  GoRoute(
    name: SignUpVerification.name,
    path: '/signup_verification_screen',
    builder: (context, state) => const SignUpVerification(),
  ),

  //Config route for login
  GoRoute(
    name: SignIn.name,
    path: '/login_screen',
    builder: (context, state) => const SignIn(),
  ),
  //Config route for calculator
  GoRoute(
    name: CalculatorScreen.name,
    path: '/calculator_screen',
    builder: (context, state) => const CalculatorScreen(),
  ),
  //Config route for invoice
  GoRoute(
    name: InvoiceScreen.name,
    path: '/invoice_screen',
    builder: (context, state) => const InvoiceScreen(),
  ),
  //Config route for 3dmodels
  GoRoute(
    name: Models3dScreen.name,
    path: '/models_3d_screen',
    builder: (context, state) => const Models3dScreen(),
  ),
]);
