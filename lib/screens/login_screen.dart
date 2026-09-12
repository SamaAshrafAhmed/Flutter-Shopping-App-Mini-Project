import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_project/components/auth_widgets.dart';
import 'package:first_flutter_project/components/custom_text_field.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:first_flutter_project/screens/sign_up_screen.dart';
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

  Future<void> _submitForm() async {
    if (formKey.currentState!.validate()) {
      try {
        // Firebase Authentication verifies the submitted account credentials.
        formKey.currentState!.validate();
        final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailCntrl.text,
          password: passCntrl.text,
        );
        if (cred.user != null) {
          print(cred.user?.email);
          showAuthSuccessDialog(
            context: context,
            message: AppLocalizations.of(context)!.successfulLogin,
            okLabel: AppLocalizations.of(context)!.ok,
          );
        }
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.message ?? AppLocalizations.of(context)!.unknownError,
            ),
          ),
        );
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
                AuthTitle(text: l10n.login),
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
                AuthNavigationLink(
                  text: l10n.noAccountSignUp,
                  onTap: () {
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
                ),
                const SizedBox(height: 24),
                AuthSubmitButton(onPressed: _submitForm, label: l10n.login),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
