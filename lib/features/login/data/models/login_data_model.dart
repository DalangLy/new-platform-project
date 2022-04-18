import 'package:platform_project_new/features/login/domain/entities/login_data.dart';

class LoginDataModel extends LoginData {
  LoginDataModel({
    required String email,
    required String password
  }) : super(
          email: email,
          password: password,
        );

  Map<String, dynamic> toJson(){
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginDataModel.fromEntity({required LoginData loginData}){
    return LoginDataModel(email: loginData.email, password: loginData.password);
  }
}
