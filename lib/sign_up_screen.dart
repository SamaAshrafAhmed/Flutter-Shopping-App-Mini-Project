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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.signUp,
            style: const TextStyle(
              fontFamily: 'Suwannaphum',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFA52489),
            ),
          ),

          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.fieldRequired;
                      } else if (!value.startsWith(RegExp('[A-Z]'))) {
                        return AppLocalizations.of(
                          context,
                        )!.nameMustStartCapital;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.fullName,
                    ),
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.fieldRequired;
                      }

                      if (!value.contains('@')) {
                        return AppLocalizations.of(context)!.emailMustContain;
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.email,
                    ),
                  ),

                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.fieldRequired;
                      } else if (value.length < 6) {
                        return AppLocalizations.of(context)!.passwordMinLength;
                      }

                      return null;
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.password,
                    ),
                  ),

                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.fieldRequired;
                      } else if (value != password) {
                        return AppLocalizations.of(
                          context,
                        )!.passwordsDoNotMatch;
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.confirmPassword,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC7A0BF),
                      foregroundColor: Colors.white,
                      fixedSize: const Size(150, 40),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return AlertDialog(
                              content: Text(
                                AppLocalizations.of(
                                  context,
                                )!.successfulRegistration,
                              ),
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
                    },
                    child: Text(AppLocalizations.of(context)!.signUp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
