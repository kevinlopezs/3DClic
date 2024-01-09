import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teka_3dclic/presentation/pages/auth/sign_up/sign_up_screen_controller.dart';
import 'package:teka_3dclic/presentation/routes/app_pages.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //Instance SignUpController
  final SignUpController signUpController = Get.put(SignUpController());
  //Intance TextEditing controller email
  final TextEditingController emailController = TextEditingController();
  //Instance TextEditing controller pwds
  final TextEditingController pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //Instance for colors apptheme
    final colors = Theme.of(context).colorScheme;
    //Instance for fonts apptheme
    final fonts = Theme.of(context).textTheme;
    //Instance for mediaquery size
    final size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff7f6fb),
        body: _SignUpBody(
          colors: colors,
          fonts: fonts,
          size: size,
          signUpController: signUpController,
          emailController: emailController,
          pwdController: pwdController,
        ));
  }
}

//SignUp body content
class _SignUpBody extends StatefulWidget {
  const _SignUpBody({
    required this.colors,
    required this.fonts,
    required this.size,
    required this.signUpController,
    required this.emailController,
    required this.pwdController,
  });
  final TextEditingController emailController;
  final TextEditingController pwdController;
  final ColorScheme colors;
  final TextTheme fonts;
  final Size size;
  final SignUpController signUpController;

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

    //Instance for listen signUpController
    final signUpController = Get.find<SignUpController>();

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

            Text('Sign up', style: widget.fonts.titleMedium),

            const SizedBox(height: 10),

            Text(
              'Please add an email and password. We send to your email a link to verify the account',
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
                    colors: widget.colors,
                    fonts: widget.fonts,
                    size: size,
                    signUpController: signUpController,
                    email: widget.emailController,
                    pwd: widget.pwdController,
                  ),
                  const SizedBox(height: 22),
                  //Botton for send verification code
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: () async {
                          await signUpController.onLogin();

                          if (signUpController.formKey.currentState!
                              .validate()) {
                            //Send arguments email and password to controller
                            signUpController.email.value =
                                widget.emailController.text;
                            signUpController.password.value =
                                widget.pwdController.text;
                            //Create a new user
                            signUpController.signUp();
                            //authServices
                            //    .checkEmailExists(widget.emailController.text);
                            Get.toNamed(AppRoutes.signInScreen);
                          } else {
                            return;
                          }
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
                          child: Text('Send', style: fonts.labelLarge),
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
  const _CustomTextFormFieldSignUp({
    required this.colors,
    required this.fonts,
    required this.size,
    required this.signUpController,
    required this.email,
    required this.pwd,
  });

  final TextEditingController email;
  final TextEditingController pwd;
  final SignUpController signUpController;
  final ColorScheme colors;
  final TextTheme fonts;
  final Size size;

  @override
  State<_CustomTextFormFieldSignUp> createState() =>
      _CustomTextFormFieldSignUpState();
}

class _CustomTextFormFieldSignUpState
    extends State<_CustomTextFormFieldSignUp> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.signUpController.formKey,
      child: Column(
        children: [
          SizedBox(
            width: widget.size.width,
            child: TextFormField(
              controller: widget.email,
              validator: (email) =>
                  widget.signUpController.validateEmail(email),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text('Email'),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onChanged: (value) {
                setState(() {
                  widget.email.text = value;
                });
              },
            ),
          ),
          20.verticalSpace,
          SizedBox(
            width: widget.size.width,
            child: TextFormField(
              style: const TextStyle(overflow: TextOverflow.visible),
              validator: (pwd) => widget.signUpController.validatePass(pwd),
              obscureText: !_isPasswordVisible,
              controller: widget.pwd,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                errorMaxLines: 5,
                label: const Text('Password'),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: InkWell(
                  child: Icon(_isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  widget.pwd.text = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
