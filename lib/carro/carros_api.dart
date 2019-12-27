import 'carro.dart';

class CarrosApi {
  static List<Carro> getCarros() {
    final carros = List<Carro>();

    carros.add(Carro(
        nome: "Ferrari FFF",
        urlFoto:
            "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png"));
    carros.add(Carro(
        nome: "Porsche Panamera",
        urlFoto:
            "http://www.livroandroid.com.br/livro/carros/esportivos/Porsche_Panamera.png"));
    carros.add(Carro(
        nome: "MERCEDES-BENZ C63 AMG UP",
        urlFoto:
            "http://www.livroandroid.com.br/livro/carros/esportivos/MERCEDES_BENZ_AMG.png"));

    return carros;
  }
}
