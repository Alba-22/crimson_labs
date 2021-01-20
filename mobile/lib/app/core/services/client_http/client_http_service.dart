import 'package:dio/dio.dart';

import 'package:crimson_labs/app/core/services/client_http/auth_interceptor.dart';
import 'package:crimson_labs/app/core/services/local_storage/local_storage_interface.dart';

import '../../models/reponse_model_http.dart';
import 'client_http_interface.dart';

class ClientHttpService implements IClientHttp {

  String _baseURL;
  Dio _dio;
  ILocalStorage _localStorage;

  ClientHttpService(this._baseURL, this._localStorage) {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseURL,
        followRedirects: false,
        receiveTimeout: 15000,
        validateStatus: (status) {
          return status <= 500;
        },
      ),
    );
    _dio.interceptors.add(AuthInterceptor(_localStorage));
  }

  @override
  Future<ResponseModelHttp<T>> get<T>(String url, {
    Map<String, dynamic> queryParameters, 
    Map<String, dynamic> headers
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: headers
      )
    );
    return ResponseModelHttp(
      data: response.data,
      headers: response.headers,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage
    );
  }

  @override
  Future<ResponseModelHttp<T>> post<T>(String url, {
    dynamic data,
    Map<String, dynamic> queryParameters, 
    Map<String, dynamic> headers
  }) async {
    final response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers
      )
    );
    return ResponseModelHttp(
      data: response.data,
      headers: response.headers,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage
    );
  }

  @override
  Future<ResponseModelHttp<T>> put<T>(String url, {
    dynamic data,
    Map<String, dynamic> queryParameters, 
    Map<String, dynamic> headers
  }) async {
    final response = await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers
      )
    );
    return ResponseModelHttp(
      data: response.data,
      headers: response.headers,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage
    );
  }

  @override
  Future<ResponseModelHttp<T>> patch<T>(String url, {
    dynamic data,
    Map<String, dynamic> queryParameters, 
    Map<String, dynamic> headers
  }) async {
    final response = await _dio.patch(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers
      )
    );
    return ResponseModelHttp(
      data: response.data,
      headers: response.headers,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage
    );
  }
}