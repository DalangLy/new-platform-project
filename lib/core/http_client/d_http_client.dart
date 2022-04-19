import 'dart:convert';
import 'package:dio/dio.dart';
import '../../abstraction/abstraction_export.dart';
import '../../config/config_export.dart';
import '../core_export.dart';

class DHttpClient implements IHttpClient{

  final Dio _dio;
  final ILocalStorage _localStorage;
  const DHttpClient(this._dio, this._localStorage);

  @override
  Future<DResponse> post({required String path, required data, DOptions? options}) async{
    try{
      final Response<dynamic> _response = await _dio.post(path, data: data);

      if(_response.data is String){
        return DResponse(statusCode: _response.statusCode, data: jsonDecode(_response.data as String));
      }
      return DResponse(statusCode: _response.statusCode, data: _response.data);
    }on DioError catch(e){
      throw Exception(e);
    }
    catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<DResponse> get({required String path, DOptions? options}) async{
    try{
      final String _token = await _getToken();
      final Response<dynamic> _response = await _dio.get(path, options: Options(
        headers: {
          'Authorization': 'Bearer $_token',
          'TerminalTypeCode': terminalTypeCode,
        }
      ));
      if(_response.data is String){
        return DResponse(statusCode: _response.statusCode, data: jsonDecode(_response.data as String));
      }
      return DResponse(statusCode: _response.statusCode, data: _response.data);
    }on DioError catch(e){
      if(e.response != null){
        if(e.response?.statusCode == 401){
          throw UnAuthorizedFailure(message: 'Unauthorized');
        }
      }
      throw Exception(e);
    }
    catch(e){
      throw Exception(e);
    }
  }

  Future<String> _getToken() async{
    try{
      final List<String> token = await _localStorage.get(key: 'token');
      if(token.isEmpty){
        throw UnAuthorizedFailure(message: 'No Token In Local Storage');
      }
      return token.first;
    }
    on Failure{
      rethrow;
    }
    catch(e){
      throw UnknownFailure(message: 'access token from local storage failed (d_http_client.dart)');
    }
  }
}