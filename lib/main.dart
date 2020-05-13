import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/blocs/bloc/clima_bloc.dart';
import 'package:flutter_weather/blocs/bloc/configuracao_bloc.dart';
import 'package:flutter_weather/blocs/bloc/tema_bloc.dart';
import 'package:flutter_weather/repositories/clima_api_client.dart';
import 'package:flutter_weather/repositories/clima_repository.dart';
import 'package:http/http.dart' as http;

import 'widgets/clima.dart';

void main() {
  final ClimaRepository climaRepository = ClimaRepository(
      climaApiClient: ClimaApiClient(httpClient: http.Client()));

  runApp(MultiBlocProvider(providers: [
    BlocProvider<TemaBloc>(
      create: (context) => TemaBloc(),
    ),
    BlocProvider<ConfiguracaoBloc>(
      create: (context) => ConfiguracaoBloc(),
    )
  ], child: App(climaRepository: climaRepository)));
}

class App extends StatelessWidget {
  final ClimaRepository climaRepository;

  App({Key key, @required this.climaRepository})
      : assert(climaRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TemaBloc, TemaState>(builder: (context, temaState) {
      return MaterialApp(
        title: "Flutter Clima",
        theme: temaState.tema,
        home: BlocProvider(
          create: (context) => ClimaBloc(climaRepository: climaRepository),
          child: Clima(),
        ),
      );
    });
  }
}
