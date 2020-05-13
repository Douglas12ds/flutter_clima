import 'package:flutter/material.dart';
import 'package:flutter_weather/blocs/bloc/configuracao_bloc.dart';

class Temperatura extends StatelessWidget {
  final double temperatura;
  final double minima;
  final double maxima;
  final UnidadesTemperatura unidadeTemperatura;

  Temperatura(
      {Key key,
      this.temperatura,
      this.minima,
      this.maxima,
      this.unidadeTemperatura})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            "${_temperaturaFormatada(temperatura)}°",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              "Max: ${_temperaturaFormatada(maxima)}°",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
            ),
            Text(
              "Min: ${_temperaturaFormatada(minima)}°",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
            )
          ],
        )
      ],
    );
  }

  int _converterParaFahrenheit(double celsius) =>
      ((celsius * 9 / 5) + 32).round();

  int _temperaturaFormatada(double t) =>
      unidadeTemperatura == UnidadesTemperatura.celsius
          ? t.round()
          : _converterParaFahrenheit(t);
}
