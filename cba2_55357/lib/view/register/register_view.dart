// material - tylko android
import 'package:flutter/material.dart';
import '../../utils/my_colors.dart';
import '../login/login_view.dart';
import '../widgets/basic_text_form_field.dart';



class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Spacer(),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go back!'),
                ),
              ),

              // Already have an account ? Sing In
              Padding(
                padding: const EdgeInsets.only(bottom: 62),
                child: ActionPrompt(
                  promptText: "Already have an account ?", // Tekst pytania
                  actionText: "Sing In",                // Tekst akcji
                  onActionTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                  promptColor: MyColors.purleColor, // Kolor pytania (opcjonalnie)
                  actionColor: MyColors.purleColor, // Kolor akcji (opcjonalnie)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}