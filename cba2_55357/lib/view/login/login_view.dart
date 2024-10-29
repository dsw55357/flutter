import 'package:cba2_55357/utils/my_colors.dart';
import 'package:cba2_55357/utils/my_images.dart';
import 'package:cba2_55357/view/register/register_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(MyImages.logo),
              Text('Sign In', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,
              color: MyColors.purleColor,
              )
              ),
              ElevatedButton(
                child: const Text('Zaloguj się'),
                onPressed: () {
                  // Navigate to second route when tapped.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}