import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/blocs/bloc/configuracao_bloc.dart';

class Configuracoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações")),
      body: ListView(
        children: <Widget>[
          BlocBuilder<ConfiguracaoBloc, ConfiguracaoState>(
              builder: (context, state) {
            return ListTile(
              title: Text("Unidade de Temperatura"),
              isThreeLine: true,
              subtitle:
                  Text("Utilizar sistema métrica como medida de temperatura"),
              trailing: Switch(
                value: state.unidadesTemperatura == UnidadesTemperatura.celsius,
                onChanged: (_) {
                  BlocProvider.of<ConfiguracaoBloc>(context)
                      .add(UnidadeDeTemperaturaAlterada());
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
