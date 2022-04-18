import 'package:flutter/material.dart';
import '../../domain/entities/login_data.dart';
import 'login_email_input.dart';
import 'login_password_input.dart';

class LoginForm extends StatefulWidget {
  final Function(LoginData data) onSubmit;
  const LoginForm({Key? key, required this.onSubmit,}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const double _inputGap = 20.0;
  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sign In', style: Theme.of(context).textTheme.headline5,),
          const SizedBox(height: _inputGap,),
          LoginEmailInput(
            onSaved: (value){
              if(value == null){
                return;
              }
              _email = value;
            },
          ),
          const SizedBox(height: _inputGap,),
          LoginPasswordInput(
            onSaved: (value){
              if(value == null){
                return;
              }
              _password = value;
            }
          ),
          const SizedBox(height: _inputGap,),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                final FormState? _form = _formKey.currentState;

                if(_form!.validate()){
                  _form.save();
                  widget.onSubmit(LoginData(email: _email, password: _password));
                }
              },
              child: const Text('Login',),
            ),
          ),
        ],
      ),
    );
  }
}
