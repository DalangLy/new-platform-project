import '../entities/entity_export.dart';

abstract class ICreateRepository{
  Future<ResponseEntity> create({required RequestEntity requestEntity});
}