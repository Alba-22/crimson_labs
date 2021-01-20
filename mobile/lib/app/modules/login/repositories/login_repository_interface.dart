import 'package:crimson_labs/app/core/models/response_model.dart';
import 'package:crimson_labs/app/modules/login/models/login_payload_model.dart';
import 'package:crimson_labs/app/modules/login/models/login_response_model.dart';

abstract class ILoginRepository {
  Future<ResponseModel<LoginResponseModel>> login(LoginPayloadModel payload);
}