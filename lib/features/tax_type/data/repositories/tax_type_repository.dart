import '../../../../core/core_export.dart';
import '../../tax_type_export.dart';

class TaxTypeRepository implements ITaxTypeRepository{
  final ITaxTypeRemoteDataSource _remoteDataSource;
  const TaxTypeRepository(this._remoteDataSource);
  @override
  Future<List<ResponseEntity>> get() {
    return _remoteDataSource.get();
  }
}