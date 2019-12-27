import 'dart:convert';

import 'package:carros/login/usuario.dart';
import 'package:carros/pages/api_response.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      final params = {
        "username": login,
        "password": senha,
      };

      String s = json.encode(params);

      print("LOGIN_API ---> login: $login, Senha: $senha");

      var response = await http.post(url, body: s, headers: headers);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      String nome = mapResponse["nome"];
      String email = mapResponse['email'];

      print("Nome : $nome");
      print("Email: $email");

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);
        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse["error"]);
    } catch (errore, exception) {
      print("erro no login $errore > $exception");

      return ApiResponse.error("Não foi possível fazer o login");
    }
  }
}
