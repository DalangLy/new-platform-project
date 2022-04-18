import '../entities/entity_export.dart';

abstract class IGetRepository{
  Future<List<ResponseEntity>> get();
}