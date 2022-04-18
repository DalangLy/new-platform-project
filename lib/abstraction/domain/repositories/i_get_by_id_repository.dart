import '../entities/entity_export.dart';

abstract class IGetByIdRepository{
  Future<ResponseEntity> getById({required String id});
}