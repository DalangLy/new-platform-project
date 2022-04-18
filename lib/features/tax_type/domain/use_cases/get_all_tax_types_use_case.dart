import '../../../../core/core_export.dart';

class GetAllTaxTypesUseCase implements IGetUseCase{
  final IGetRepository _repository;
  const GetAllTaxTypesUseCase(this._repository);
  @override
  Future<List<ResponseEntity>> call() {
    return _repository.get();
  }
}