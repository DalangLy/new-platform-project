import '../entities/entity_export.dart';

abstract class ICreateUseCase{
  Future<ResponseEntity> call({required RequestEntity requestEntity});
}