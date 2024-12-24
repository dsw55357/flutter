import 'package:flutter/material.dart';
import 'package:cba2_55357/utils/my_colors.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 19.0),
        child: Text(
          'Sign In',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: MyColors.purleColor, // Upewnij się, że MyColors jest poprawnie zaimportowane.
          ),
        ),
      ),
    );
  }
}


class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? errorText;
  final String hintText;

  const EmailInputField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.errorText,
    this.hintText = 'Email or User name',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Container(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              errorText: errorText,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ),
    );
  }
}


class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? errorText;
  final String hintText;

  final bool obscureText;
  final VoidCallback? onToggleVisibility; // Zmieniono na opcjonalny

  const PasswordInputField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.errorText,
    this.hintText = 'Password',
    this.obscureText=true,
    this.onToggleVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Container(
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            obscureText: obscureText, // Ukrycie tekstu (dla haseł)
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              errorText: errorText,
              errorStyle: TextStyle(color: Colors.red),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: onToggleVisibility,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final VoidCallback? onTap;

  const ForgetPasswordText({
    Key? key,
    this.text = 'Forget Password?',
    this.style,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 21.0, top: 16),
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: style ??
                TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: MyColors.purleColor, // Możesz dostosować kolor
                ),
          ),
        ),
      ),
    );
  }
}


class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final Size minimumSize;

  const LoginButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.purple,
    this.textColor = Colors.white,
    this.borderRadius = 15.0,
    this.minimumSize = const Size(390, 50),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            minimumSize: minimumSize,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}


class SignUpPrompt extends StatelessWidget {
  final VoidCallback onSignUpTap;

  const SignUpPrompt({Key? key, required this.onSignUpTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account?",
          style: TextStyle(color: MyColors.purleColor, fontSize: 14),
        ),
        SizedBox(width: 5), // Odstęp między tekstami
        GestureDetector(
          onTap: onSignUpTap,
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: MyColors.purleColor,
              fontSize: 14,
              fontWeight: FontWeight.bold, // Pogrubienie tekstu
            ),
          ),
        ),
      ],
    );
  }
}