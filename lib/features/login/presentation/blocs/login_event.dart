part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class Login extends LoginEvent {
  final LoginData loginData;
  const Login({required this.loginData});
  @override
  List<Object> get props => [];
}