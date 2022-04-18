import '../models/login_data_model.dart';
import '../models/token_model.dart';

abstract class ILoginRemoteDataSource{
  Future<TokenModel> login({required LoginDataModel loginDataModel,});
}