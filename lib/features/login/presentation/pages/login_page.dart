import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app_export.dart';
import '../../../../core/http_client/d_http_client.dart';
import '../../../../core/local_storage/d_local_storage.dart';
import '../../data/data_sources/login_local_data_source.dart';
import '../../data/data_sources/login_remote_data_source.dart';
import '../../data/repositories/login_repository.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../blocs/login_bloc.dart';
import '../widgets/login_form.dart';
import '../widgets/login_layout.dart';

class LoginPage extends StatelessWidget {
  final Function(bool isLoggedIn) onLoginResult;
  final VoidCallback onRegisterTapped;
  const LoginPage({Key? key, required this.onLoginResult, required this.onRegisterTapped,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(LoginUseCase(LoginRepository(LoginRemoteDataSource(DHttpClient()), LoginLocalDataSource(DLocalStorage())))),
      child: Builder(
        builder: (context) {
          return BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                onLoginResult(true);
              }
            },
            child: Scaffold(
              body: SafeArea(
                child: LoginLayout(
                  loginForm: LoginForm(
                    onSubmit: (data) {
                      BlocProvider.of<LoginBloc>(context).login(loginData: data);
                    },
                  ),
                  registerButton: ElevatedButton(
                    onPressed: onRegisterTapped,
                    child: const Text('Register'),
                  ),
                  themeButton: Column(
                    children: [
                      ElevatedButton(onPressed: (){
                        CustomMaterialApp.of(context)!.changeTheme(themeMode: ThemeMode.system);
                      }, child: const Text('System')),
                      ElevatedButton(onPressed: (){
                        CustomMaterialApp.of(context)!.changeTheme(themeMode: ThemeMode.light);
                      }, child: const Text('Light')),
                      ElevatedButton(onPressed: (){
                        CustomMaterialApp.of(context)!.changeTheme(themeMode: ThemeMode.dark);
                      }, child: const Text('Dark')),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
