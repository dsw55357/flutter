// material - tylko android
import 'package:cba2_55357/utils/database_helper.dart';
import 'package:flutter/material.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_images.dart';
import '../home/home.dart';
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

  String? _validateField(FormFieldData field){

    final value = field.controller.text;
    if(value.isEmpty) {
      return '${field.hintText} nie może być pusty';
    }

    if(field.name == 'password') {
      if(value.length < 8) {
        return 'Password must be at least 8 characters long';
      }
    }

    if(field.name == 'passwordCon') {
      final password = _formFields.firstWhere((f) => f.name == 'password').controller.text; // warunek, który sprawdza, czy nazwa pola to 'password'
      if (value!= password) {
        return 'Passwords do not match';
      }
    }
    return null;
  }

  Future<void> _validateOnSubmit() async {
    print('analiza pól przed zapisaniem');

    setState(() {
      for(var field in _formFields) {
        field.error = _validateField(field);
      }
    });

    if(_formFields.every((field) => field.error == null)) {
      print('Form is valid');
      // zapisujemy zatem dane do bazy
      // Wydobycie danych z pól
      final name = _formFields.firstWhere((f) => f.name == 'name').controller.text;
      final email = _formFields.firstWhere((f) => f.name == 'email').controller.text;
      final password = _formFields.firstWhere((f) => f.name == 'password').controller.text;

      _registerUser(name, email, password);

    } else {
      print('Form contains errors');
    }
  }

  void _registerUser(String name, String email, String password) async {
    final result = await DatabaseHelper.instance.registerUser(name, email, password);

    if(result != -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully $name, $email, $password')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const HomeView()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed')),
      );
    }
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
              EmailInputField(
                controller: _formFields[1].controller,
                focusNode: _formFields[1].focusNode,
                errorText: _formFields[1].error,
                hintText: _formFields[1].hintText,
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
                  onPressed: _validateOnSubmit, backgroundColor: MyColors.purle2Color
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