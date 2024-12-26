import 'package:flutter/material.dart';
import 'package:cba2_55357/utils/my_colors.dart';

import '../../utils/my_images.dart';

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
  final Widget? prefixIcon; // Dodanie zmiennej prefixIcon

  const EmailInputField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.errorText,
    this.hintText = 'Email or User name',
    this.prefixIcon, // Dodanie prefixIcon do konstruktora
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
              //border: OutlineInputBorder(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0), // Zaokrąglenie narożników
              ),
              //prefixIcon: Icon(Icons.person),
              prefixIcon: prefixIcon ?? Icon(Icons.person), // Ustawienie domyślnej ikony
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
              //border: OutlineInputBorder(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0), // Zaokrąglenie narożników
              ),
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


class ActionPrompt extends StatelessWidget {
  final VoidCallback onActionTap;
  final String promptText;
  final String actionText;
  final Color promptColor;
  final Color actionColor;

  const ActionPrompt({
    Key? key,
    required this.promptText,
    required this.actionText,
    required this.onActionTap,
    this.promptColor = Colors.black, // Domyślny kolor dla promptText
    this.actionColor = Colors.blue, // Domyślny kolor dla actionText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          this.promptText,
          style: TextStyle(color: promptColor, fontSize: 14),
        ),
        SizedBox(width: 5), // Odstęp między tekstami
        GestureDetector(
          onTap: onActionTap,
          child: Text(
            this.actionText,
            style: TextStyle(
              color: actionColor,
              fontSize: 14,
              fontWeight: FontWeight.bold, // Pogrubienie tekstu
            ),
          ),
        ),
      ],
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final TextStyle? textStyle;

  const CustomBackButton({
    Key? key,
    this.imagePath = MyImages.back,
    this.buttonText = "Back",
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SizedBox(
          height: 20,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Image.asset(imagePath),
              ),
              Text(
                buttonText,
                style: textStyle ?? TextStyle(color: Colors.purple, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}