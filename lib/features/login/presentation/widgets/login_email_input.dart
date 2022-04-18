import 'package:flutter/material.dart';
import '../../../../core/core_export.dart';

class LoginEmailInput extends StatelessWidget {
  final Function(String? value) onSaved;
  const LoginEmailInput({Key? key, required this.onSaved,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Username',
        prefixIcon: Icon(Icons.person),
        label: Text('Username'),
      ),
      initialValue: 'admin@gmail.com',
      onSaved: onSaved,
      validator: (String? value) {
        if(value!.isEmpty){
          return 'email must be valid.';
        }
        if (!value.isEmail()) {
          return 'please enter email format.';
        }
        return null;
      },
    );
  }
}

