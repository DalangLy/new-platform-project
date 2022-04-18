import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final VoidCallback onRegisterSuccess;
  final VoidCallback backToLoginTapped;
  const RegisterPage({Key? key, required this.onRegisterSuccess, required this.backToLoginTapped,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onRegisterSuccess,
                child: const Text('Register'),
              ),
              ElevatedButton(
                onPressed: backToLoginTapped,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
