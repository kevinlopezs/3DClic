import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:teka_3dclic/presentation/routes/app_pages.dart';
import '../../screens.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    //Instance for colors apptheme
    final colors = Theme.of(context).colorScheme;
    //Instance for fonts apptheme
    final fonts = Theme.of(context).textTheme;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff7f6fb),
        body: _SignUpBody(colors: colors, fonts: fonts));
  }
}

//SignUp body content
class _SignUpBody extends StatefulWidget {
  const _SignUpBody({
    required this.colors,
    required this.fonts,
  });

  final ColorScheme colors;
  final TextTheme fonts;

  @override
  State<_SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<_SignUpBody> {
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size; -->this is to get screen size
    final fonts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    final size = MediaQuery.of(context).size;

    //Scroll is used to auto scroll when user uses textformfield
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const BouncingScrollPhysics(),
      reverse: true,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          children: [
            //Icon go back
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back_ios_outlined,
                    size: 32, color: widget.colors.primary),
              ),
            ),

            const SizedBox(height: 18),

            //Lottie animation
            Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  color: widget.colors.primaryContainer,
                  shape: BoxShape.circle),
              child: Lottie.asset('assets/lottie/animation_printer1.json',
                  height: size.height * 0.3),
            ),

            const SizedBox(
              height: 24,
            ),

            Text('Registrarse', style: widget.fonts.titleMedium),

            const SizedBox(height: 10),

            Text(
              'Agregue su número de teléfono. Le enviaremos un código de verificación',
              style: widget.fonts.titleSmall,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  //This is CustomTextFormField
                  _CustomTextFormFieldSignUp(
                      colors: widget.colors, fonts: widget.fonts),
                  const SizedBox(height: 22),
                  //Botton for send verification code
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.signUpVerificationScreen);
                        },
                        style: ButtonStyle(
                            //elevation: const MaterialStatePropertyAll(12.0),
                            foregroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            backgroundColor:
                                MaterialStatePropertyAll(colors.primary),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(24.0)))),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text('Enviar', style: fonts.labelLarge),
                        )),
                  ),
                ],
              ),
            ),

            //This is a Padding using MediaQuery for when keyboard raised
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom)),
          ],
        ),
      )),
    );
  }
}

//Custom TextFormField SignUp body content
class _CustomTextFormFieldSignUp extends StatefulWidget {
  const _CustomTextFormFieldSignUp({required this.colors, required this.fonts});

  final ColorScheme colors;
  final TextTheme fonts;

  @override
  State<_CustomTextFormFieldSignUp> createState() =>
      _CustomTextFormFieldSignUpState();
}

class _CustomTextFormFieldSignUpState
    extends State<_CustomTextFormFieldSignUp> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: widget.fonts.bodySmall,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(10)),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              '(+57)',
              style: widget.fonts.bodySmall,
            ),
          ),
          suffixIcon: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 32,
          )),
    );
  }
}
