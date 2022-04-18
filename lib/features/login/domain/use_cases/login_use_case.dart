
import '../entities/login_data.dart';
import '../repositories/i_login_repository.dart';

class LoginUseCase{
  final ILoginRepository _repository;
  const LoginUseCase(this._repository);
  Future<void> call({required LoginData loginData}){
    return _repository.login(loginData: loginData);
  }
}