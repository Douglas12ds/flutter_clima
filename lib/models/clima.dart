import 'package:equatable/equatable.dart';

enum CondicaoClimatica {
  neve,
  chuvaComNeve,
  granizo,
  tempestade,
  chuvaPesada,
  chuvaLeve,
  chuvisco,
  nublado,
  parcialmenteNublado,
  limpo,
  desconhecido
}

class Clima extends Equatable {
  final CondicaoClimatica condicao;
  final String condicaoFormatada;
  final double tempMinima;
  final double temperatura;
  final double tempMaxima;
  final int idLocalidade;
  final String criado;
  final DateTime ultimaAtualizacao;
  final String localidade;

  const Clima(
      {this.condicao,
      this.condicaoFormatada,
      this.tempMinima,
      this.temperatura,
      this.tempMaxima,
      this.idLocalidade,
      this.criado,
      this.ultimaAtualizacao,
      this.localidade});

  @override
  List<Object> get props => [
        condicao,
        condicaoFormatada,
        tempMinima,
        temperatura,
        tempMaxima,
        idLocalidade,
        criado,
        ultimaAtualizacao,
        localidade
      ];

  static Clima fromJson(dynamic json) {
    final climaConsolidado = json['consolidated_weather'][0];
    return Clima(
      condicao: _mapStringParaCondicaoClimatica(climaConsolidado['weather_state_abbr']),
     condicaoFormatada: climaConsolidado['weather_state_name'],
     tempMinima: climaConsolidado['min_temp'] as double,
     temperatura: climaConsolidado['the_temp'] as double,
     tempMaxima: climaConsolidado['max_temp'] as double,
     idLocalidade: climaConsolidado['woeid'] as int,
     criado: climaConsolidado['created'],
     ultimaAtualizacao: DateTime.now(),
     localidade: json['title']
    );
  }

  static CondicaoClimatica _mapStringParaCondicaoClimatica(String entrada) {
    CondicaoClimatica estado;
    switch (entrada) {
      case 'sn':
        estado =
        CondicaoClimatica.neve;
        break;
      case 'sl':
        estado =
        CondicaoClimatica.chuvaComNeve;
        break;
      case 'h':
        estado=
        CondicaoClimatica.granizo;
        break;
      case 't':
        estado=
        CondicaoClimatica.tempestade;
        break;
      case 'hr':
        estado=
        CondicaoClimatica.chuvaPesada;
        break;
      case 'lr':
        estado=
        CondicaoClimatica.chuvaLeve;
        break;
      case 's':
        estado=
        CondicaoClimatica.chuvisco;
        break;
      case 'hc':
        estado=
        CondicaoClimatica.nublado;
        break;
      case 'lc':
        estado=
        CondicaoClimatica.parcialmenteNublado;
        break;
      case 'c':
        estado=
        CondicaoClimatica.limpo;
        break;
      default:
        estado=
        CondicaoClimatica.desconhecido;
    }
    return estado;
  }
}