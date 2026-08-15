import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:first_flutter_project/shopping_screen.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  String? password;

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
    if (value != password) {
      return l10n.passwordsDoNotMatch;
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

  // Only continue after all fields pass validation.
  void _submitForm() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            content: Text(AppLocalizations.of(context)!.successfulRegistration),
            actions: [
              TextButton(
                onPressed: () {
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
  }

  Widget _buildTextField({
    required String label,
    required String? Function(String?) validator,
    bool obscureText = false,
    ValueChanged<String>? onChanged,
  }) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(labelText: label),
    );
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
                Text(
                  l10n.signUp,
                  style: const TextStyle(
                    fontFamily: 'Suwannaphum',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA52489),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField(label: l10n.fullName, validator: _validateName),
                const SizedBox(height: 12),
                _buildTextField(label: l10n.email, validator: _validateEmail),
                const SizedBox(height: 12),
                _buildTextField(
                  label: l10n.password,
                  validator: _validatePassword,
                  obscureText: true,
                  onChanged: (value) => password = value,
                ),
                const SizedBox(height: 12),
                _buildTextField(
                  label: l10n.confirmPassword,
                  validator: _validateConfirmPassword,
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC7A0BF),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(150, 40),
                  ),
                  onPressed: _submitForm,
                  child: Text(l10n.signUp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
