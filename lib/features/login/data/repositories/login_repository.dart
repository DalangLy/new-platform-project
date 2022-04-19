import 'package:platform_project_new/core/core_export.dart';
import 'package:platform_project_new/core/errors/unknown_failure.dart';
import '../../../../abstraction/abstraction_export.dart';
import '../../domain/entities/login_data.dart';
import '../../domain/repositories/i_login_repository.dart';
import '../data_sources/i_login_local_data_source.dart';
import '../data_sources/i_login_remote_data_source.dart';
import '../models/login_data_model.dart';
import '../models/token_model.dart';

class LoginRepository implements ILoginRepository{
  final ILoginRemoteDataSource _remoteDataSource;
  final ILoginLocalDataSource _localDataSource;
  const LoginRepository(this._remoteDataSource, this._localDataSource,);
  @override
  Future<void> login({required LoginData loginData}) async{
    try{
      final TokenModel _tokenModel = await _remoteDataSource.login(loginDataModel: LoginDataModel.fromEntity(loginData: loginData));
      final bool _isLoggedIn = await _localDataSource.storeToken(tokenModel: _tokenModel);
      print(_isLoggedIn);
    }on Failure{
      rethrow;
    }
    catch(e){
      throw UnknownFailure(message: 'Failed to Storage Token');
    }
  }
}