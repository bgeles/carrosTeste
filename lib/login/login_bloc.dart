import 'dart:async';

import 'package:carros/login/login_api.dart';
import 'package:carros/login/usuario.dart';
import 'package:carros/pages/api_response.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();

  get stream => _streamController.stream;

  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    _streamController.add(true);

    print('PASSOU PELA PUBLICACAO DO STREAM 1');

    ApiResponse response = await LoginApi.login(login, senha);

    _streamController.add(false);

    print('PASSOU PELA PUBLICACAO DO STREAM 2');

    return response;
  }

  void dispose() {
    _streamController.close();
  }
}
