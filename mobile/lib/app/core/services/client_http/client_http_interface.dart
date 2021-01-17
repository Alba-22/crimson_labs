import '../../models/reponse_model_http.dart';

abstract class IClientHttp {
  Future<ResponseModelHttp<T>> get<T>(String url, {
    Map<String, dynamic> queryParameters, 
    Map<String, dynamic> headers
  });
  Future<ResponseModelHttp<T>> post<T>(String url, {
    dynamic data,
    Map<String, dynamic> queryParameters, 
    Map<String, dynamic> headers
  });
  Future<ResponseModelHttp<T>> put<T>(String url, {
    dynamic data,
    Map<String, dynamic> queryParameters, 
    Map<String, dynamic> headers
  });
  Future<ResponseModelHttp<T>> patch<T>(String url, {
    dynamic data,
    Map<String, dynamic> queryParameters, 
    Map<String, dynamic> headers
  });
}