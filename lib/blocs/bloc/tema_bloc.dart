import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/models/clima.dart';

part 'tema_event.dart';
part 'tema_state.dart';

class TemaBloc extends Bloc<TemaEvent, TemaState> {
  @override
  TemaState get initialState =>
      TemaState(tema: ThemeData.light(), cor: Colors.lightBlue);

  @override
  Stream<TemaState> mapEventToState(
    TemaEvent event,
  ) async* {
    if (event is ClimaAlterado) {
      yield _mapCondicaoClimaticatoThemeData(event.condicaoClimatica);
    }
  }

  TemaState _mapCondicaoClimaticatoThemeData(
      CondicaoClimatica condicaoClimatica) {
    TemaState tema;
    switch (condicaoClimatica) {
      case CondicaoClimatica.limpo:
      case CondicaoClimatica.parcialmenteNublado:
        tema = TemaState(
            tema: ThemeData(primaryColor: Colors.orangeAccent),
            cor: Colors.yellow);
        break;
      case CondicaoClimatica.granizo:
      case CondicaoClimatica.neve:
      case CondicaoClimatica.chuvaComNeve:
        tema = TemaState(
            tema: ThemeData(primaryColor: Colors.lightBlueAccent),
            cor: Colors.lightBlue);
        break;
      case CondicaoClimatica.nublado:
        tema = TemaState(
            tema: ThemeData(primaryColor: Colors.blueGrey), cor: Colors.grey);
        break;
      case CondicaoClimatica.chuvaLeve:
      case CondicaoClimatica.chuvaPesada:
      case CondicaoClimatica.chuvisco:
        tema = TemaState(
            tema: ThemeData(primaryColor: Colors.indigoAccent),
            cor: Colors.indigo);
        break;
      case CondicaoClimatica.tempestade:
        tema = TemaState(
            tema: ThemeData(primaryColor: Colors.deepPurpleAccent),
            cor: Colors.deepPurple);
        break;
      case CondicaoClimatica.desconhecido:
        tema = TemaState(tema: ThemeData.light(), cor: Colors.lightBlue);
        break;
    }
    return tema;
  }
}
