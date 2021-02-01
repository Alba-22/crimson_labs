import 'package:crimson_labs/app/modules/login/models/login_response_model.dart';
import 'package:crimson_labs/app/modules/login/models/login_payload_model.dart';
import 'package:crimson_labs/app/core/models/response_model.dart';
import 'package:crimson_labs/app/modules/login/repositories/login_repository_interface.dart';

class LoginRepositoryMock implements ILoginRepository {
  @override
  Future<ResponseModel<LoginResponseModel>> login(LoginPayloadModel payload) async {
    if (payload.email == "alba@test.io" && payload.password == "123456789") {
      return ResponseModel<LoginResponseModel>(
        statusCode: 200,
        data: LoginResponseModel(
          id: "id",
          token: "token",
        ),
      );
    }
    else {
      return ResponseModel<LoginResponseModel>(
        statusCode: 404,
        data: LoginResponseModel(
          message: "User or password invalid"
        ),
      );
    }
  }

}