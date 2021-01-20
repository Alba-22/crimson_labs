import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:crimson_labs/app/core/services/local_storage/local_storage_interface.dart';

class AuthInterceptor implements InterceptorsWrapper {

  ILocalStorage _localStorage;

  AuthInterceptor(this._localStorage);

  @override
  Future onError(DioError err) async {
    if (err.response.statusCode == 401 || err.response.statusCode == 403) {
      await _localStorage.delete("token");
      await _localStorage.delete("userId");
      Modular.to.pushReplacementNamed("/login");
      return;
    }
    return err;
  }
  
  @override
  Future onRequest(RequestOptions options) async {
    if (options.headers.containsKey("requiresToken")) {
      options.headers.remove("requiresToken");
      final token = await _localStorage.get("token");
      options.headers.addAll({
        "x-access-token": token,
      });
    }
    return options;
  }
  
  @override
  Future onResponse(Response response) async {
    return response;
  }

}