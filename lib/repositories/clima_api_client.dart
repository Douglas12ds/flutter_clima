import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather/models/models.dart';
import 'package:http/http.dart' as http;

class ClimaApiClient {
  static const urlBase = "https://www.metaweather.com";
  final http.Client httpClient;

  ClimaApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<int> getIdLocalidade(String cidade) async {
    final urlLocalidade = "$urlBase/api/location/search/?query=$cidade";
    final respostaLocalidade = await this.httpClient.get(urlLocalidade);
    if (respostaLocalidade.statusCode != 200){
      throw Exception('Erro tentando encontrar id da cidade.');
    }

    final localidadeJSON = jsonDecode(respostaLocalidade.body) as List;
    return (localidadeJSON.first)['woeid'];
  }

  Future<Clima> fetchClima(int idLocalidade) async {
    final urlClima = '$urlBase/api/location/$idLocalidade';
    final respostaClima = await this.httpClient.get(urlClima);

    if (respostaClima.statusCode != 200){
      throw Exception('Erro tentando encontrar id da localidade.');
    }

    final climaJSON = jsonDecode(respostaClima.body);
    return Clima.fromJson(climaJSON);
  }
}


/*
Future<Weather> fetchWeather(int locationId) async {
  final weatherUrl = '$baseUrl/api/location/$locationId';
  final weatherResponse = await this.httpClient.get(weatherUrl);

  if (weatherResponse.statusCode != 200) {
    throw Exception('error getting weather for location');
  }

  final weatherJson = jsonDecode(weatherResponse.body);
  return Weather.fromJson(weatherJson);
}
*/