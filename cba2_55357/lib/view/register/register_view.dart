// material - tylko android
import 'package:flutter/material.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_images.dart';
import '../login/login_view.dart';
import '../widgets/basic_text_form_field.dart';

class FormFieldData {
  final String name;
  final TextEditingController controller;
  final FocusNode focusNode;
  String? error;
  final String hintText;
  final Widget? prefixIcon;

  FormFieldData({
    required this.name,
    required this.controller,
    required this.focusNode,
    this.error,
    required this.hintText,
    this.prefixIcon,
  });
}

class RegisterView extends StatefulWidget {

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  /*final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  String? _nameError = '.';

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  String? _emailError = '.';

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  String? _passwordError = '.';

  final TextEditingController _passwordConController = TextEditingController();
  final FocusNode _passwordConFocus = FocusNode();
  String? _passwordConError = '.';*/

  final List<FormFieldData> _formFields = [];

  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _validate() async {
    print('analiza pól przed zapisaniem');
  }

  @override
  void dispose() {
    // Zwalniamy zasoby
    for (var field in _formFields) {
      field.controller.dispose();
      field.focusNode.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _formFields.addAll([
      FormFieldData(
        name: 'name',
        controller: TextEditingController(),
        focusNode: FocusNode(),
        hintText: 'Full Name',
      ),
      FormFieldData(
        name: 'email',
        controller: TextEditingController(),
        focusNode: FocusNode(),
        hintText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
      FormFieldData(
        name: 'password',
        controller: TextEditingController(),
        focusNode: FocusNode(),
        hintText: 'Password',
      ),
      FormFieldData(
        name: 'passwordCon',
        controller: TextEditingController(),
        focusNode: FocusNode(),
        hintText: 'Confirm Password',
      ),
    ]);

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
              CustomBackButton(),

              const SizedBox(height: 62), // Przestrzeń od góry
              SignInHeader(),
              SizedBox(height: 20), // Odstęp między tekstem a polem tekstowym

/*              EmailInputField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  errorText: _nameError,
                  hintText: "Full Name"
              ),*/
              EmailInputField(
                controller: _formFields[0].controller,
                focusNode: _formFields[0].focusNode,
                errorText: _formFields[0].error,
                hintText: _formFields[0].hintText,
              ),
              SizedBox(height: 40), // Odstęp między pierwszym a drugim polem

/*              EmailInputField(
                controller: _emailController,
                focusNode: _emailFocus,
                errorText: _emailError,
                hintText: "Email",
                prefixIcon: Icon(Icons.email), // Można użyć dowolnej ikony
              ),*/
              PasswordInputField(
                controller: _formFields[2].controller,
                focusNode: _formFields[2].focusNode,
                errorText: _formFields[2].error,
                obscureText: _obscureText,
                onToggleVisibility: _togglePasswordVisibility,
              ),
              SizedBox(height: 40), // Odstęp między pierwszym a drugim polem

/*              PasswordInputField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                errorText: _passwordError,
                obscureText: _obscureText,
                onToggleVisibility: _togglePasswordVisibility,
              ),*/
              PasswordInputField(
                controller: _formFields[2].controller,
                focusNode: _formFields[2].focusNode,
                errorText: _formFields[2].error,
                obscureText: _obscureText,
                onToggleVisibility: _togglePasswordVisibility,
              ),
              SizedBox(height: 40), // Odstęp między pierwszym a drugim polem

/*              PasswordInputField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                errorText: _passwordError,
                obscureText: _obscureText,
                onToggleVisibility: _togglePasswordVisibility,
                  hintText: "Confirm Password"
              ),*/
              PasswordInputField(
                controller: _formFields[3].controller,
                focusNode: _formFields[3].focusNode,
                errorText: _formFields[3].error,
                obscureText: _obscureText,
                onToggleVisibility: _togglePasswordVisibility,
                hintText: _formFields[3].hintText,
              ),
              SizedBox(height: 40), // Odstęp między pierwszym a drugim polem

              LoginButton(
                  text: 'Sign Up',
                  onPressed: _validate, backgroundColor: MyColors.purle2Color
              ),


              Spacer(),
/*              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Go back!'),
                ),
              ),*/

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