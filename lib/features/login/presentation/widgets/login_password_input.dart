import 'package:flutter/material.dart';
import '../../../../core/core_export.dart';

class LoginPasswordInput extends StatefulWidget {
  final Function(String? value) onSaved;
  const LoginPasswordInput({Key? key, required this.onSaved,}) : super(key: key);

  @override
  State<LoginPasswordInput> createState() => _LoginPasswordInputState();
}

class _LoginPasswordInputState extends State<LoginPasswordInput> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: 'Password',
        prefixIcon: const Icon(Icons.lock),
        label: const Text('Password'),
        suffixIcon: IconButton(
          onPressed: () => setState(() {
            _obscureText = !_obscureText;
          }),
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,),
        ),
      ),
      obscureText: _obscureText,
      initialValue: '@Password168',
      onSaved: widget.onSaved,
      validator: (String? value) {
        if(value!.isEmpty){
          return 'password must be valid.';
        }
        else if (!value.isPassword()) {
          return 'min 8, at least 1 Upper, Lower, Number, Special Char';
        }
        return null;
      },
    );
  }
}
