import '../entities/entity_export.dart';

abstract class IDeleteUseCase{
  Future<String> call({required DeleteEntity deleteEntity});
}