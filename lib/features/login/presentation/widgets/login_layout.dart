import 'package:flutter/material.dart';

class LoginLayout extends StatelessWidget {
  final Widget loginForm;
  final Widget registerButton;
  final Widget themeButton;
  const LoginLayout({Key? key, required this.loginForm, required this.registerButton, required this.themeButton,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildStack(),
      ),
    );
  }
  Widget _buildStack(){
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Positioned(
          width: 300,
          child: loginForm,
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: registerButton,
        ),
        Positioned(
          top: 10.0,
          right: 10.0,
          child: themeButton,
        ),
      ],
    );
  }
}
