import 'package:cba2_55357/utils/my_colors.dart';
import 'package:cba2_55357/utils/my_images.dart';
import 'package:cba2_55357/view/home/home.dart';
import 'package:cba2_55357/view/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/basic_text_form_field.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  String? _emailError = '.';
  String? _passwordError = '.';

  void _validateEmail() {
    final email = _emailController.text;
      // Sprawdzenie e-maila
      if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email)) {
        setState(() {
          _emailError = "Podaj poprawny adres e-mail";
        });
        return;
      } else {
        _emailError = null;
      }
  }

  void _validatePassword() {
    final password = _passwordController.text;
      // Sprawdzenie hasła
    setState(() {
      if (password.isEmpty) {
          _passwordError = "Pole hasła nie może być puste";
          return;
      } else if(password.length < 8) {
        _passwordError = 'Hasło musi mieć co najmniej 8 znaków';
        return;
      } else {
        _passwordError = null;
      }
  });

  }

  Future<void> _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('isLoggedIn', true);
    });
  }

  //void _validateOnSubmit() {
  Future<void> _validateOnSubmit() async {
    setState(() {
    if(_passwordError==null && _emailError == null) {
      print("submit...");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const HomeView()),
      );

      // Jeśli walidacja się powiedzie, zapisujemy isLoggedIn = true
      _isLoggedIn();
    }
    });
  }

  @override
  void dispose() {
    // Zwalniamy zasoby
    _passwordController.dispose();
    _passwordFocus.dispose();
    _emailController.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();

    _passwordFocus.addListener(() {
      if(!_passwordFocus.hasFocus){
        _validatePassword();
      }
    });
    _emailFocus.addListener(() {
      if(!_emailFocus.hasFocus){
        _validateEmail();
      }
    });

  }

  /*
  String? validator(String? value)
  {
      print('!! validator.$value');
      if (value == null || value.isEmpty) {
        return 'This field is required';
      }
      if (value != null && value.contains('@')) {
        return 'Do not use the @ char.';
      }
      return null;
  } */
  @override
  Widget build(BuildContext context) {
    return SafeArea( //wrapuj widzet, odsuwamy się od paska systemowego
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: SizedBox( //widzet praktyczniejszy niz continer
          width: double.infinity, //cała szerokość ekranu
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column( // opis jak zmienić 1:04:12
              // children - lista
              children: [
                const SizedBox(height: 62), // Przestrzeń od góry
                Image.asset(MyImages.logo),
                // const
                const SizedBox(height: 21), // Odstęp między grafiką a tekstem
                /*
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 19.0),
                    child: Text('Sign In',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: MyColors.purleColor,
                        )),
                  ),
                ), */

                SignInHeader(),


                SizedBox(height: 20), // Odstęp między tekstem a polem tekstowym

                /*
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    child: Container(
                      //height: 50,
                      child: TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocus,
                        decoration: InputDecoration(
                          hintText: 'Email or User name',
                          // Podpowiedź dla pierwszego pola
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          errorText: _emailError,
                        ),
                        keyboardType: TextInputType
                            .emailAddress, // Klawiatura dostosowana do e-maili
                      ),
                    ),
                  ),
                ),
                  */
              EmailInputField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  errorText: _emailError,
                ),

                SizedBox(height: 16), // Odstęp między pierwszym a drugim polem

                // Drugie pole
                /*
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    child: Container(
                      //width: 390,
                      //height: 50,
                      child: TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        decoration: InputDecoration(
                          hintText: 'Password', // Podpowiedź
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          errorText: _passwordError,
                          //helperText: ' ',
                          errorStyle: TextStyle(color: Colors.red),
                        ),
                        obscureText: true, // Ukrycie tekstu (hasło)
                      ),
                    ),
                  ),
                ),*/
                PasswordInputField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  errorText: _passwordError,
                ),


                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 21.0, top: 16),
                    child: Text('Forget Password ?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: MyColors.purleColor,
                        )),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, // kolor tła przycisku
                        minimumSize: const Size(390, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15), // zaokrąglenie na 15px
                        ), // szerokość i wysokość
                      ),
                      child: const Text(
                        'Zaloguj się',
                        style: TextStyle(
                            color: Colors.white), // kolor tekstu na biały),
                      ),
                      onPressed: () =>_validateOnSubmit(), // Navigate to second route when tapped.
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
*
*
*
*
*
* */