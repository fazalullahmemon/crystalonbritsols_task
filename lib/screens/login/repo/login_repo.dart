import 'package:crystalonbritsols_task/network/api_paths.dart';
import 'package:crystalonbritsols_task/network/dio_client.dart';
import 'package:crystalonbritsols_task/screens/login/data/generate_token_response.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  final dioClient = DioClient.dioClient;

  Future<GenerateTokenResponse?> login({
    required String username,
    required String password,
  }) async {
    final formData = FormData.fromMap({
      "username": username,
      "password": "CwFm8hYHUhOkmf5es0xqYg==",
      "grant_type": "password",
      "client_id": "629569fa-8c19-477b-bdee-828e1ae83463",
      "scope": "offline_access"
    });
    final response =
        await dioClient.postRequest(getPath(ApiPath.tokens), body: formData);

    return GenerateTokenResponse.fromJson(response);
  }
}
