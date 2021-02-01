import 'package:crimson_labs/app/core/models/reponse_model_http.dart';
import 'package:crimson_labs/app/core/services/client_http/client_http_interface.dart';
import 'package:crimson_labs/app/modules/login/models/login_payload_model.dart';
import 'package:crimson_labs/app/modules/login/models/login_response_model.dart';
import 'package:crimson_labs/app/modules/login/repositories/login_repository.dart';
import 'package:crimson_labs/app/modules/login/repositories/login_repository_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements IClientHttp {}

void main() {
  ILoginRepository repository;
  MockClient client;

  setUp(() {
    client = MockClient();
    repository = LoginRepository(client);
  });

  group('LoginRepository Test', () {
     test("First Test", () {
       expect(repository, isInstanceOf<ILoginRepository>());
     });

    test('Execute Login', () async {
      final payload = LoginPayloadModel(
        email: "alba@test.io",
        password: "123456789"
      );
      when(client.post(
        "/login",
        data: payload.toJson()
      ))
      .thenAnswer((_) async {
        return ResponseModelHttp(
          data: {
            "token": "token",
            "id": "id",
          },
          statusCode: 200,
        );
      });
      final response = await repository.login(payload);
      expect(response.statusCode, 200);
      expect(response.data, isInstanceOf<LoginResponseModel>());
      expect(response.data.token, "token");
      expect(response.data.id, "id");
    });
  });
}
