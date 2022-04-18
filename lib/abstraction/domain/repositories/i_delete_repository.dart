import '../entities/entity_export.dart';

abstract class IDeleteRepository{
  Future<String> delete({required DeleteEntity deleteEntity});
}