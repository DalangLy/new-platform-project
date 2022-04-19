import '../../../../abstraction/abstraction_export.dart';
import '../../../../core/core_export.dart';
import '../models/login_data_model.dart';
import '../models/token_model.dart';
import 'i_login_remote_data_source.dart';

class LoginRemoteDataSource implements ILoginRemoteDataSource{

  final IHttpClient _httpClient;
  const LoginRemoteDataSource(this._httpClient,);

  @override
  Future<TokenModel> login({required LoginDataModel loginDataModel}) async{
    try{
      final DResponse<dynamic> _response = await _httpClient.post(
          path: '/api/identity/token',
          data: loginDataModel.toJson(),
      );
      if(_response.statusCode == 200){
        return TokenModel.fromJson(json: _response.data['data']);
      }
      else{
        throw LoginFailure(message: 'login Failed');
      }
    }on Failure catch(e){
      print(e);
      rethrow;
    }
    catch(e){
      throw LoginFailure(message: 'Login Failed');
    }
  }
}