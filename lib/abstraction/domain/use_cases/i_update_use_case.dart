import '../entities/entity_export.dart';

abstract class IUpdateUseCase{
  Future<ResponseEntity> call({required RequestEntity requestEntity});
}