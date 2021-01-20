import '../../models/response_model.dart';
import '../../models/user_model.dart';

abstract class IUserRepository {
  Future<ResponseModel<UserModel>> getUserData();
}