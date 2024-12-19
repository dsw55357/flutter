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
