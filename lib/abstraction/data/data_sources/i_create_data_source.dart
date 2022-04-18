import '../../abstraction_export.dart';

abstract class ICreateDataSource{
  Future<ResponseEntity> create({required RequestEntity requestEntity});
}