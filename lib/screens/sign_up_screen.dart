import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_project/components/auth_widgets.dart';
import 'package:first_flutter_project/components/custom_text_field.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:first_flutter_project/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailCntrl = TextEditingController();
  TextEditingController passCntrl = TextEditingController();

  // Keep the confirm field synced with the entered password.
  String? _validateName(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return l10n.fieldRequired;
    }
    if (!value.trim().startsWith(RegExp(r'[A-Z]'))) {
      return l10n.nameMustStartCapital;
    }
    return null;
  }

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

  String? _validateConfirmPassword(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) {
      return l10n.fieldRequired;
    }
    if (value != passCntrl.text) {
      return l10n.passwordsDoNotMatch;
    }
    return null;
  }

  // Only continue after all fields pass validation.
  Future<void> _submitForm() async {
    if (formKey.currentState!.validate()) {
      try {
        // Firebase Authentication creates the account after local validation.
        final userCred = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailCntrl.text,
              password: passCntrl.text,
            );

        if (userCred.user != null) {
          print(userCred.user?.email);
          showAuthSuccessDialog(
            context: context,
            message: AppLocalizations.of(context)!.successfulRegistration,
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
                AuthTitle(text: l10n.signUp),
                const SizedBox(height: 20),
                CustomTextField(label: l10n.fullName, validator: _validateName),
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
                const SizedBox(height: 12),
                CustomTextField(
                  label: l10n.confirmPassword,
                  validator: _validateConfirmPassword,
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                AuthNavigationLink(
                  text: l10n.alreadyHaveAccountLoginInstead,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                AuthSubmitButton(onPressed: _submitForm, label: l10n.signUp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
