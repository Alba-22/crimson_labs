import 'package:flutter/foundation.dart';

import 'package:crimson_labs/app/core/models/response_model.dart';
import 'package:crimson_labs/app/core/models/user_model.dart';
import 'package:crimson_labs/app/core/repositories/user/user_repository_interface.dart';
import 'package:crimson_labs/app/core/services/client_http/client_http_interface.dart';

class UserRepository implements IUserRepository {

  IClientHttp _clientHttp;

  UserRepository(this._clientHttp);

  @override
  Future<ResponseModel<UserModel>> getUserData() async {
    
    try {
      final response = await _clientHttp.get(
        "/users/me",
        headers: {
          "requiresToken": true
        }
      );
      return new ResponseModel<UserModel>(
        data: UserModel.fromJson(response.data),
        statusCode: response.statusCode,
      );
    }
    catch(error) {
      debugPrint("UserRepository getUserData Error: $error");
      return ResponseModel<UserModel>(
        errorMessage: error.toString(),
      );
    }

  }

}