import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/blocs/bloc/configuracao_bloc.dart';
import 'package:flutter_weather/models/clima.dart';
import 'package:flutter_weather/widgets/condicoes_climaticas.dart';
import 'package:flutter_weather/widgets/temperatura.dart';

class ClimaTemperaturaJuntos extends StatelessWidget {
  final Clima clima;

  ClimaTemperaturaJuntos({Key key, @required this.clima})
      : assert(clima != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: CondicoesClimaticas(
                condicao: clima.condicao,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: BlocBuilder<ConfiguracaoBloc, ConfiguracaoState>(
                    builder: (context, state) {
                  return Temperatura(
                    temperatura: clima.temperatura,
                    maxima: clima.tempMaxima,
                    minima: clima.tempMinima,
                    unidadeTemperatura: state.unidadesTemperatura,
                  );
                }))
          ],
        ),
        Center(
            child: Text(
          clima.condicaoFormatada,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w200, color: Colors.white),
        ))
      ],
    );
  }
}
