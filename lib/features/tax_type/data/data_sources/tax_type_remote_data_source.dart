import '../../../../abstraction/abstraction_export.dart';
import '../../../../core/core_export.dart';
import '../../tax_type_export.dart';

class TaxTypeRemoteDataSource implements ITaxTypeRemoteDataSource{

  final IHttpClient _httpClient;
  const TaxTypeRemoteDataSource(this._httpClient);

  @override
  Future<List<ResponseEntity>> get() async{
    try{
      final DResponse<dynamic> _response = await _httpClient.get(
        path: '/api/tax-types',
      );
      if(_response.statusCode == 200){
        final List<dynamic> parsed = _response.data['Data'];
        return parsed.map((e) => TaxTypeModel.fromJson(json: e)).toList();
      }
      else{
        throw UnknownFailure(message: 'fsdfdsf');
      }
    }on Failure{
      rethrow;
    }
    catch(e){
      throw UnknownFailure(message: e.toString());
    }
  }
}