import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:teka_3dclic/presentation/pages/auth/sign_in/sign_in_controller.dart';

class SignIn extends StatefulWidget {
  static const name = 'signup_verification_screen';
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Instance SignUpController
  final SignInController signInController = Get.put(SignInController());
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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xfff7f6fb),
        body: _SignUpVerificationBody(
          colors: colors,
          fonts: fonts,
          emailController: emailController,
          pwdController: pwdController,
          signInController: signInController,
        ));
  }
}

class _SignUpVerificationBody extends StatefulWidget {
  const _SignUpVerificationBody(
      {required this.colors,
      required this.fonts,
      required this.signInController,
      required this.emailController,
      required this.pwdController});

  final ColorScheme colors;
  final TextTheme fonts;
  final SignInController signInController;
  final TextEditingController emailController;
  final TextEditingController pwdController;

  @override
  State<_SignUpVerificationBody> createState() =>
      _SignUpVerificationBodyState();
}

class _SignUpVerificationBodyState extends State<_SignUpVerificationBody> {
  @override
  Widget build(BuildContext context) {
    //Device screen size
    final size = MediaQuery.of(context).size;
    //Instance for listen signUpController
    final signInController = Get.find<SignInController>();

    return SingleChildScrollView(
      //physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      reverse: true,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back_ios_outlined,
                    size: 32, color: widget.colors.primary),
              ),
            ),
            Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  color: widget.colors.primaryContainer,
                  shape: BoxShape.circle),
              child: Lottie.asset(
                  'assets/lottie/animation_code_verification.json',
                  alignment: Alignment.centerRight),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text('Sign in', style: widget.fonts.titleMedium),
            const SizedBox(height: 10),
            Text(
              'Type your email/password',
              style: widget.fonts.titleSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                _CustomTextFormFieldSignIn(
                    colors: widget.colors,
                    fonts: widget.fonts,
                    size: size,
                    signInController: signInController,
                    email: widget.emailController,
                    pwd: widget.pwdController),
                const SizedBox(
                  height: 12,
                ),

                //Button verify OTP auth
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0)))),
                      onPressed: () async {
                        await signInController.onLogin();
                        if (signInController.formKey.currentState!.validate()) {
                          //Send arguments email and password to controller
                          signInController.email.value =
                              widget.emailController.text;
                          signInController.password.value =
                              widget.pwdController.text;
                          signInController.signIn();
                        } else {
                          return;
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text('Sign in'),
                      )),
                )
              ]),
            ),

            const SizedBox(
              height: 12,
            ),

            const SizedBox(
              height: 1,
            ),

            TextButton(onPressed: () {}, child: const Text('Forgot password?')),

            //This is a Padding using MediaQuery for when keyboard raised
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom)),
          ],
        ),
      )),
    );
  }

  //Widget design for code verification
  /*Widget _textFieldOTP({required bool first, required bool last}) {
    final fonts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 50,
      child: AspectRatio(
        aspectRatio: 0.8,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: fonts.bodySmall,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
              counter: const Offstage(),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.black12),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: colors.primary),
                  borderRadius: BorderRadius.circular(12))),
        ),
      ),
    );
  }*/
}

//Custom TextFormField SignUp body content
class _CustomTextFormFieldSignIn extends StatefulWidget {
  const _CustomTextFormFieldSignIn({
    required this.colors,
    required this.fonts,
    required this.size,
    required this.signInController,
    required this.email,
    required this.pwd,
  });

  final TextEditingController email;
  final TextEditingController pwd;
  final SignInController signInController;
  final ColorScheme colors;
  final TextTheme fonts;
  final Size size;

  @override
  State<_CustomTextFormFieldSignIn> createState() =>
      _CustomTextFormFieldSignInState();
}

class _CustomTextFormFieldSignInState
    extends State<_CustomTextFormFieldSignIn> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.signInController.formKey,
      child: Column(
        children: [
          SizedBox(
            width: widget.size.width,
            child: TextFormField(
              controller: widget.email,
              validator: (email) =>
                  widget.signInController.validateEmail(email),
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
              validator: (pwd) => widget.signInController.validatePass(pwd),
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
