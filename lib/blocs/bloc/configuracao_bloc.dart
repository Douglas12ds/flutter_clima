import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'configuracao_event.dart';
part 'configuracao_state.dart';

class ConfiguracaoBloc extends Bloc<ConfiguracaoEvent, ConfiguracaoState> {
  @override
  ConfiguracaoState get initialState =>
      ConfiguracaoState(unidadesTemperatura: UnidadesTemperatura.celsius);

  @override
  Stream<ConfiguracaoState> mapEventToState(
    ConfiguracaoEvent event,
  ) async* {
    if (event is UnidadeDeTemperaturaAlterada) {
      yield ConfiguracaoState(
          unidadesTemperatura:
              state.unidadesTemperatura == UnidadesTemperatura.celsius
                  ? UnidadesTemperatura.fahrenheit
                  : UnidadesTemperatura.celsius);
    }
  }
}
