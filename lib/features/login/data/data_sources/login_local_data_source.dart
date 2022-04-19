import 'package:platform_project_new/core/core_export.dart';
import 'package:platform_project_new/core/errors/unknown_failure.dart';
import 'package:platform_project_new/features/login/data/data_sources/i_login_local_data_source.dart';
import 'package:platform_project_new/features/login/data/models/token_model.dart';
import '../../../../abstraction/abstraction_export.dart';

class LoginLocalDataSource implements ILoginLocalDataSource{
  final ILocalStorage _localStorage;
  const LoginLocalDataSource(this._localStorage);
  @override
  Future<bool> storeToken({required TokenModel tokenModel}) async{
    try{
      final bool _isSaved = await _localStorage.save(name: 'token', data: tokenModel.toString());
      return _isSaved;
    }on Failure{
      rethrow;
    }
    catch(e){
      throw UnknownFailure(message: 'message');
    }
  }
}