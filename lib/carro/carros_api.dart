import 'dart:convert' as convert;

import 'carro.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static get headers => null;

  static Future<List<Carro>> getCarros(String tipo) async {
    var url =
        'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo';

    print("url ->>>$url");

    var response = await http.get(url, headers: headers);

    String json = response.body;

    List list = convert.json.decode(json);

    final carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();

    return carros;
  }
}
