import 'package:flutter/material.dart';
import 'package:flutter_weather/models/models.dart';
import 'package:flutter_weather/repositories/repositories.dart';

class ClimaRepository {
  final ClimaApiClient climaApiClient;

  ClimaRepository({@required this.climaApiClient}): assert(climaApiClient != null);

  Future<Clima> getClima(String cidade) async {
    final int idLocalidade = await climaApiClient.getIdLocalidade(cidade);
    return climaApiClient.fetchClima(idLocalidade);
  }
}