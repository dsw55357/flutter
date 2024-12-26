// material - tylko android
import 'package:flutter/material.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_images.dart';
import '../login/login_view.dart';
import '../widgets/basic_text_form_field.dart';



class RegisterView extends StatefulWidget {

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  String? _nameError = '.';

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  String? _emailError = '.';

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  String? _passwordError = '.';

  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _validate() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 59), // Przestrzeń
              Align(
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
                        child: Image.asset(MyImages.back),
                    ),
                    Text(
                      "Back",
                      style: TextStyle(color: MyColors.purleColor, fontSize: 12),
                    ),
                  ],
                )),
                ),
              ),

              const SizedBox(height: 62), // Przestrzeń od góry
              SignInHeader(),
              SizedBox(height: 20), // Odstęp między tekstem a polem tekstowym

              EmailInputField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  errorText: _nameError,
                  hintText: "Full Name"
              ),
              SizedBox(height: 40), // Odstęp między pierwszym a drugim polem

              EmailInputField(
                controller: _emailController,
                focusNode: _emailFocus,
                errorText: _emailError,
                hintText: "Email",
                prefixIcon: Icon(Icons.email), // Można użyć dowolnej ikony
              ),
              SizedBox(height: 40), // Odstęp między pierwszym a drugim polem

              PasswordInputField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                errorText: _passwordError,
                obscureText: _obscureText,
                onToggleVisibility: _togglePasswordVisibility,
              ),
              SizedBox(height: 40), // Odstęp między pierwszym a drugim polem

              PasswordInputField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                errorText: _passwordError,
                obscureText: _obscureText,
                onToggleVisibility: _togglePasswordVisibility,
                  hintText: "Confirm Password"
              ),

              SizedBox(height: 40), // Odstęp między pierwszym a drugim polem

              LoginButton(
                  text: 'Sign Up',
                  onPressed: _validate, backgroundColor: MyColors.purle2Color
              ),


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