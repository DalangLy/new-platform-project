import '../entities/entity_export.dart';

abstract class IGetUseCase{
  Future<List<ResponseEntity>> call();
}