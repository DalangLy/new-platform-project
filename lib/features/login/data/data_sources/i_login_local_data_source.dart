import 'package:platform_project_new/features/login/data/models/token_model.dart';

abstract class ILoginLocalDataSource{
  Future<bool> storeToken({required TokenModel tokenModel});
}