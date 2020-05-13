import 'package:flutter/material.dart';
import 'package:flutter_weather/models/clima.dart';

class CondicoesClimaticas extends StatelessWidget {
  final CondicaoClimatica condicao;

  CondicoesClimaticas({Key key, @required this.condicao})
      : assert(condicao != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapCondicaoParaImage(condicao);

  Image _mapCondicaoParaImage(CondicaoClimatica condicao) {
    Image imagem;
    switch (condicao) {
      case CondicaoClimatica.limpo:
      case CondicaoClimatica.parcialmenteNublado:
        imagem = Image.asset('assets/limpo.png');
        break;
      case CondicaoClimatica.granizo:
      case CondicaoClimatica.neve:
      case CondicaoClimatica.chuvaComNeve:
        imagem = Image.asset('assets/nevando.png');
        break;
      case CondicaoClimatica.nublado:
        imagem = Image.asset('assets/nublado.png');
        break;
      case CondicaoClimatica.chuvaLeve:
      case CondicaoClimatica.chuvaPesada:
      case CondicaoClimatica.chuvisco:
        imagem = Image.asset('assets/chuvoso.png');
        break;
      case CondicaoClimatica.tempestade:
        imagem = Image.asset('assets/tempestade.png');
        break;
      case CondicaoClimatica.desconhecido:
        imagem = Image.asset('assets/limpo.png');
        break;
    }
    return imagem;
  }
}