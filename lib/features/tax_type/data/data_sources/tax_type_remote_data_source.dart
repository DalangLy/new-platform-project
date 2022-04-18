import '../../../../core/core_export.dart';
import '../../tax_type_export.dart';

class TaxTypeRemoteDataSource implements ITaxTypeRemoteDataSource{

  final IHttpClient _httpClient;
  const TaxTypeRemoteDataSource(this._httpClient);

  @override
  Future<List<ResponseEntity>> get() async{
    try{
      const String _token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjA1NmNiNGUyLTM0Y2YtNGIyNS02NjY1LTA4ZDk2NDhlMjQ5MiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6ImFkbWluQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJBVGVjaCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL3N1cm5hbWUiOiJHcm91cCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiMDk4ODA4ODIyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW5pc3RyYXRvciIsIlBlcm1pc3Npb24iOlsiUGVybWlzc2lvbnMuVmVyc2lvblR5cGVzLkNyZWF0ZSIsIlBlcm1pc3Npb25zLlZlcnNpb25UeXBlcy5WaWV3IiwiUGVybWlzc2lvbnMuVmVyc2lvblR5cGVzLkVkaXQiLCJQZXJtaXNzaW9ucy5WZXJzaW9uVHlwZXMuRGVsZXRlIiwiUGVybWlzc2lvbnMuVXNlcnMuQ3JlYXRlIiwiUGVybWlzc2lvbnMuVXNlcnMuVmlldyIsIlBlcm1pc3Npb25zLlVzZXJzLkVkaXQiLCJQZXJtaXNzaW9ucy5Vc2Vycy5EZWxldGUiLCJQZXJtaXNzaW9ucy5Sb2xlcy5DcmVhdGUiLCJQZXJtaXNzaW9ucy5Sb2xlcy5WaWV3IiwiUGVybWlzc2lvbnMuUm9sZXMuRWRpdCIsIlBlcm1pc3Npb25zLlJvbGVzLkRlbGV0ZSIsIlBlcm1pc3Npb25zLlNvdXJjZXMuQ3JlYXRlIiwiUGVybWlzc2lvbnMuU291cmNlcy5WaWV3IiwiUGVybWlzc2lvbnMuU291cmNlcy5FZGl0IiwiUGVybWlzc2lvbnMuU291cmNlcy5EZWxldGUiLCJQZXJtaXNzaW9ucy5Tb3VyY2VzVHlwZXMuQ3JlYXRlIiwiUGVybWlzc2lvbnMuU291cmNlc1R5cGVzLlZpZXciLCJQZXJtaXNzaW9ucy5Tb3VyY2VzVHlwZXMuRWRpdCIsIlBlcm1pc3Npb25zLlNvdXJjZXNUeXBlcy5EZWxldGUiXSwiZXhwIjoxNjUwODc2MDk0fQ.RvixP7b5Jo2cAhutZpwGaX8j-3lvg335sYFpptj9F7I';
      final DResponse<dynamic> _response = await _httpClient.get(
        path: 'https://96.9.67.188:4434/api/tax-types',
        options: const DOptions(
          headers: {
            'Authorization': 'Bearer $_token',
            'TerminalTypeCode': 'CMA01',
          }
        ),
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