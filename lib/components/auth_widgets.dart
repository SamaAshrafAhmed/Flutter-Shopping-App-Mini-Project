import 'package:flutter/material.dart';
import 'package:first_flutter_project/screens/shopping_screen.dart';

void goToShoppingScreen(BuildContext context) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const ShoppingScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: child,
        );
      },
    ),
  );
}

Future<void> showAuthSuccessDialog({
  required BuildContext context,
  required String message,
  required String okLabel,
}) async {
  await showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              goToShoppingScreen(context);
            },
            child: Text(okLabel),
          ),
        ],
      );
    },
  );
}

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Suwannaphum',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFFA52489),
      ),
    );
  }
}

class AuthNavigationLink extends StatelessWidget {
  const AuthNavigationLink({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(decoration: TextDecoration.underline),
      ),
    );
  }
}

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFC7A0BF),
        foregroundColor: Colors.white,
        fixedSize: const Size(150, 40),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
