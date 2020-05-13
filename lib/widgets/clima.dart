import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/blocs/bloc/clima_bloc.dart';
import 'package:flutter_weather/blocs/bloc/tema_bloc.dart';
import 'package:flutter_weather/widgets/clima_temperatura_juntos.dart';
import 'package:flutter_weather/widgets/configuracoes.dart';
import 'package:flutter_weather/widgets/gradient_container.dart';
import 'package:flutter_weather/widgets/localidade.dart';
import 'package:flutter_weather/widgets/selecao_cidade.dart';
import 'package:flutter_weather/widgets/ultima_atualizacao.dart';

class Clima extends StatefulWidget {
  @override
  _ClimaState createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  Completer<void> _atualizarCompleter;

  @override
  void initState() {
    super.initState();
    _atualizarCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Clima"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Configuracoes()));
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.search),
            onPressed: () async {
              final cidade = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelecaoCidade()),
              );
              if (cidade != null) {
                BlocProvider.of<ClimaBloc>(context)
                    .add(FetchClima(cidade: cidade));
              }
            }),
        body: Center(
            child: BlocConsumer<ClimaBloc, ClimaState>(
          listener: (context, state) {
            if (state is ClimaCarregado) {
              BlocProvider.of<TemaBloc>(context)
                  .add(ClimaAlterado(condicaoClimatica: state.clima.condicao));
              _atualizarCompleter?.complete();
              _atualizarCompleter = Completer();
            }
          },
          builder: (context, state) {
            if (state is ClimaVazio) {
              return Center(child: Text('Por favor, escolha uma localidade'));
            }
            if (state is ClimaCarregando) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ClimaCarregado) {
              final clima = state.clima;
              return BlocBuilder<TemaBloc, TemaState>(
                  builder: (context, temaState) {
                return GradientContainer(
                    cor: temaState.cor,
                    child: RefreshIndicator(
                      onRefresh: () {
                        BlocProvider.of<ClimaBloc>(context)
                            .add(AtualizarClima(cidade: clima.localidade));
                        return _atualizarCompleter.future;
                      },
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Center(
                                child:
                                    Localidade(localidade: clima.localidade)),
                          ),
                          Center(
                            child: UltimaAtualizacao(
                                dateTime: clima.ultimaAtualizacao),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 50.0),
                            child: ClimaTemperaturaJuntos(clima: clima),
                          ),
                        ],
                      ),
                    ));
              });
            }
            if (state is ClimaErro) {
              return Center(
                  child: Text("Alguma coisa deu errado!",
                      style: TextStyle(color: Colors.red)));
            }
          },
        )));
  }
}
