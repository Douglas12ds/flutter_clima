import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/models/clima.dart';
import 'package:flutter_weather/repositories/clima_repository.dart';

part 'clima_event.dart';
part 'clima_state.dart';

class ClimaBloc extends Bloc<ClimaEvent, ClimaState> {
  final ClimaRepository climaRepository;

  ClimaBloc({@required this.climaRepository}) : assert(climaRepository != null);

  @override
  ClimaState get initialState => ClimaVazio();

  @override
  Stream<ClimaState> mapEventToState(
    ClimaEvent event,
  ) async* {
    if (event is FetchClima) {
      yield ClimaCarregando();
    }
    try {
      final Clima clima = await climaRepository.getClima(event.cidade);
      yield ClimaCarregado(clima: clima);
    } catch (_) {
      yield ClimaErro();
    }
    if (event is AtualizarClima) {
      try {
        final Clima clima = await climaRepository.getClima(event.cidade);
        yield ClimaCarregado(clima: clima);
      } catch (_) {
        yield ClimaErro();
      }
    }
  }
}

