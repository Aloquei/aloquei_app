import 'dart:convert';
import 'dart:io';
import 'dart:math';

import '../../core/models/cities_model.dart';
import '../../core/models/estados_model.dart';

class IbgeRepository {
  String _urlStates =
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados/';
  String _urlCities =
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados/{state}/municipios';

  Future<List<CitiesModel>> getCitiesFromState(int state) async {
    String temp = _urlCities.replaceFirst("{state}", state.toString());
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.getUrl(Uri.parse(temp));
    HttpClientResponse response = await request.close();

    List<CitiesModel> list = [];
    if (response.statusCode == 200) {
      String contents = await response.transform(utf8.decoder).join();
      var items = json.decode(contents);
      for (var item in items) {
        list.add(CitiesModel.fromJson(item));
      }
    }
    return list;
  }

  Future<List<EstadosModel>> getStates() async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.getUrl(Uri.parse(_urlStates));
    HttpClientResponse response = await request.close();

    List<EstadosModel> list = [];
    if (response.statusCode == 200) {
      String contents = await response.transform(utf8.decoder).join();
      var items = json.decode(contents);
      for (var item in items) {
        list.add(EstadosModel.fromJson(item));
      }
    }
    return list;
  }

  Future<CitiesModel> getRandomCity(int state) async {
    String temp = _urlCities.replaceFirst("{state}", state.toString());
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.getUrl(Uri.parse(temp));
    HttpClientResponse response = await request.close();

    List<CitiesModel> list = [];
    if (response.statusCode == 200) {
      String contents = await response.transform(utf8.decoder).join();
      var items = json.decode(contents);
      for (var item in items) {
        list.add(CitiesModel.fromJson(item));
      }
    }
    Random r = Random();
    int val = r.nextInt(list.length - 1);
    return list[val];
  }

  Future<EstadosModel> getRandomState() async {
    HttpClient client = new HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    int min = 11;
    int max = 53;
    Random rnd = new Random();
    int val = min + rnd.nextInt(max - min);

    HttpClientRequest request =
        await client.getUrl(Uri.parse(_urlStates + "/" + val.toString()));
    HttpClientResponse response = await request.close();

    EstadosModel est;
    if (response.statusCode == 200) {
      String contents = await response.transform(utf8.decoder).join();
      var item = json.decode(contents);
      est = EstadosModel.fromJson(item);
    }
    return est;
  }
}
