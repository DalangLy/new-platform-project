import 'package:platform_project_new/core/errors/unknown_failure.dart';

class GetAllTaxTypesUseCase{
  Future<void> call(){
    throw UnknownFailure(message: 'Failed');
  }
}