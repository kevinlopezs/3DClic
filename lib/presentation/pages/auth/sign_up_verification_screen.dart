import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SignUpVerification extends StatefulWidget {
  static const name = 'signup_verification_screen';
  const SignUpVerification({super.key});

  @override
  State<SignUpVerification> createState() => _SignUpVerificationState();
}

class _SignUpVerificationState extends State<SignUpVerification> {
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
        ));
  }
}

class _SignUpVerificationBody extends StatefulWidget {
  const _SignUpVerificationBody({required this.colors, required this.fonts});

  final ColorScheme colors;
  final TextTheme fonts;

  @override
  State<_SignUpVerificationBody> createState() =>
      _SignUpVerificationBodyState();
}

class _SignUpVerificationBodyState extends State<_SignUpVerificationBody> {
  @override
  Widget build(BuildContext context) {
    //Device screen size
    final size = MediaQuery.of(context).size;

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
                onTap: () => context.pop(),
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
            Text('Verificar', style: widget.fonts.titleMedium),
            const SizedBox(height: 10),
            Text(
              'Ingrese el código generado',
              style: widget.fonts.titleSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //6 six codes verification
                    _textFieldOTP(first: true, last: false),
                    _textFieldOTP(first: false, last: false),
                    _textFieldOTP(first: false, last: false),
                    _textFieldOTP(first: false, last: false),
                    _textFieldOTP(first: false, last: false),
                    _textFieldOTP(first: false, last: true),
                  ],
                ),

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
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text('Verificar'),
                      )),
                )
              ]),
            ),

            const SizedBox(
              height: 12,
            ),

            Text(
              '¿No recibió ningún código?',
              style: widget.fonts.titleSmall,
            ),

            const SizedBox(
              height: 1,
            ),

            TextButton(onPressed: () {}, child: const Text('Reenviar código')),

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
  Widget _textFieldOTP({required bool first, required bool last}) {
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
  }
}
