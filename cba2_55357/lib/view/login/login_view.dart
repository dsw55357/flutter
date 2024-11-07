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
              SizedBox(height: 62), // Przestrzeń od góry

              Image.asset(MyImages.logo),
              SizedBox(height: 20), // Odstęp między grafiką a tekstem

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 19.0),
                child: Text('Sign In', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,
                color: MyColors.purleColor,
                )
                ),
              ),
          ),
              SizedBox(height: 20), // Odstęp między tekstem a polem tekstowym
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:21.0),
                child: Container(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email or User name', // Podpowiedź dla pierwszego pola
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.emailAddress, // Klawiatura dostosowana do e-maili
                  ),
                ),
              ),
          ),
              SizedBox(height: 16), // Odstęp między pierwszym a drugim polem
          // Drugie pole
          Align(
            alignment: Alignment.centerLeft,
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal:21.0),
            child: Container(
              width: 390,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password', // Podpowiedź
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true, // Ukrycie tekstu (hasło)
              ),
            ),
          ),
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