import 'package:cba2_55357/utils/my_colors.dart';
import 'package:cba2_55357/utils/my_images.dart';
import 'package:cba2_55357/view/register/register_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  String? _emailError;
  String? _passwordError;

  void _validatePassword() {
    final email = _emailController.text;
    final password = _passwordController.text;
    
    setState(() {

      // Sprawdzenie e-maila
      if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email)) {
        _emailError = "Podaj poprawny adres e-mail.";
      } else {
        _emailError = null;
      }

      print(password);
      // Sprawdzenie hasła
      if (password.isEmpty) {
        _passwordError = "Pole hasła nie może być puste.";
      } else if(password.length < 8) {
        _passwordError = 'Hasło musi mieć co najmniej 8 znaków.';
      } else {
        _passwordError = null;
      }
    });
  }

  void _validateOnSubmit() {

    if(_passwordError==null) {
      Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => const RegisterView()),
      );
    }
  }

  @override
  void initState(){
    super.initState();
    _passwordFocus.addListener(() {
      if(!_passwordFocus.hasFocus){
        _validatePassword();
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
        body: SizedBox( //widzet praktyczniejszy niz continer
          width: double.infinity, //cała szerokość ekranu
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column( // opis jak zmienić 1:04:12
              // children - lista
              children: [
                const SizedBox(height: 62), // Przestrzeń od góry
                Image.asset(MyImages.logo),
                // const przyswpiesz kompilację
                const SizedBox(height: 21), // Odstęp między grafiką a tekstem

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
                ),

                SizedBox(height: 20), // Odstęp między tekstem a polem tekstowym

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    child: Container(
                      //height: 50,
                      child: TextFormField(
                        controller: _emailController,
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
                SizedBox(height: 16), // Odstęp między pierwszym a drugim polem
                // Drugie pole
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
                      onPressed: _validateOnSubmit, // Navigate to second route when tapped.
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