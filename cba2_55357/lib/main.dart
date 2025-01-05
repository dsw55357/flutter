import 'package:cba2_55357/view/home/home.dart';
import 'package:cba2_55357/view/login/login_view.dart';
import 'package:cba2_55357/view/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    debugShowCheckedModeBanner: false, // Ukrywa pasek "DEBUG"
    home: LoginView(),
  ));
}
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Upewnia się, że Flutter jest zainicjalizowany
  final bool isLoggedIn = await _checkLoginStatus();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

Future<bool> _checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Basics',
      debugShowCheckedModeBanner: false, // Ukrywa pasek "DEBUG"
      home: isLoggedIn ? const LoginView() : const HomeView(),
      //home: isLoggedIn ? const RegisterView() : const LoginView(),
    );
  }
}