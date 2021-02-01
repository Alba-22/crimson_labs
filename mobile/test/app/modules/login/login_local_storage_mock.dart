import 'package:crimson_labs/app/core/services/local_storage/local_storage_interface.dart';

class LoginLocalStorageMock implements ILocalStorage {
  @override
  Future delete(String key) {
    return null;
  }
  
  @override
  Future get(String key) async {
    if (key == "token") {
      return "token";
    }
    else if (key == "userId") {
      return "userId";
    }
    else {
      return key;
    }
  }
  
  @override
  Future put(String key, value) {
    return null;
  }

}