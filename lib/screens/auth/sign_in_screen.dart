import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {

  final VoidCallback toggleView;

  const SignInScreen({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(Icons.person),
            label: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
