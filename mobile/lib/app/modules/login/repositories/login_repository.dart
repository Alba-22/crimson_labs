import 'package:flutter/foundation.dart';

import 'package:crimson_labs/app/core/models/response_model.dart';
import 'package:crimson_labs/app/core/services/client_http/client_http_interface.dart';
import 'package:crimson_labs/app/modules/login/models/login_payload_model.dart';
import 'package:crimson_labs/app/modules/login/models/login_response_model.dart';
import 'package:crimson_labs/app/modules/login/repositories/login_repository_interface.dart';

class LoginRepository implements ILoginRepository {

  IClientHttp _clientHttp;

  LoginRepository(this._clientHttp);

  @override
  Future<ResponseModel<LoginResponseModel>> login(LoginPayloadModel payload) async {
    try {
      final response = await _clientHttp.post(
        "/login",
        data: payload.toJson(),
      );
      return new ResponseModel(
        data: LoginResponseModel.fromJson(response.data),
        statusCode: response.statusCode,
      );
    }
    catch (e) {
      debugPrint("LoginRepository Login Error: $e");
      return new ResponseModel(
        errorMessage: e.toString(),
      );
    }
  }

}