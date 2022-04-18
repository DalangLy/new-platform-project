import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:platform_project_new/core/http_client/i_http_client.dart';

class DHttpClient implements IHttpClient{
  final Dio _dio = Dio();
  Future<DResponse<dynamic>> post({required String path, required dynamic data, DOptions? options}) async{
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
}