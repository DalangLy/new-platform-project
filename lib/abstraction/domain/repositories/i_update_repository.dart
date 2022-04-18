import '../entities/entity_export.dart';

abstract class IUpdateRepository{
  Future<ResponseEntity> update({required RequestEntity requestEntity});
}