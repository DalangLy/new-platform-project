abstract class IHttpClient{
  Future<DResponse<dynamic>> post({required String path, required dynamic data, DOptions? options});
}

class DResponse<T>{
  final int? statusCode;
  final dynamic data;
  const DResponse({required this.statusCode, required this.data,});
}

class DOptions{
  final Map<String, dynamic>? headers;
  const DOptions({this.headers,});
}