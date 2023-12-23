// ignore: depend_on_referenced_packages
import 'package:go_router/go_router.dart';
import 'package:teka_3dclic/presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
  //Config route for home
  GoRoute(
    path: '/',
    name: Welcome.name,
    builder: (context, state) => const Welcome(),
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
    name: Login.name,
    path: '/login_screen',
    builder: (context, state) => const Login(),
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
