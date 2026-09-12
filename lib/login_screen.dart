import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_project/components/custom_text_field.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:first_flutter_project/shopping_screen.dart';
import 'package:first_flutter_project/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailCntrl = TextEditingController();
  final passCntrl = TextEditingController();

  String? _validateEmail(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.fieldRequired;
    }
    if (!value.contains('@')) {
      return l10n.emailMustContain;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) {
      return l10n.fieldRequired;
    }
    if (value.length < 6) {
      return l10n.passwordMinLength;
    }
    return null;
  }

  void _goToShoppingScreen() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (context, animation, secondaryAnimation) {
          return const ShoppingScreen();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
      ),
    );
  }

  Future<void> _submitForm() async {
    if (formKey.currentState!.validate()) {
      try {
        formKey.currentState!.validate();
        final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailCntrl.text,
          password: passCntrl.text,
        );
        if (cred.user != null) {
          print(cred.user?.email);
          showDialog(
            context: context,
            builder: (dialogContext) {
              return AlertDialog(
                content: Text(
                  AppLocalizations.of(context)!.successfulRegistration,
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      Navigator.of(dialogContext).pop();
                      _goToShoppingScreen();
                    },
                    child: Text(AppLocalizations.of(context)!.ok),
                  ),
                ],
              );
            },
          );
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.message ?? 'Unknown error')));
      }
    }
  }

  @override
  void dispose() {
    emailCntrl.dispose();
    passCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA52489),
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: l10n.email,
                  validator: _validateEmail,
                  controller: emailCntrl,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  label: l10n.password,
                  validator: _validatePassword,
                  controller: passCntrl,
                  obscureText: true,
                ),

                const SizedBox(height: 24),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpPage();
                      },
                    ),
                    );
                  },
                  child: Text(
                    "Don't have account? Sign Up Instead",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC7A0BF),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(150, 40),
                  ),
                  onPressed: _submitForm,
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
