import '../entities/login_data.dart';

abstract class ILoginRepository{
  Future<void> login({required LoginData loginData});
}