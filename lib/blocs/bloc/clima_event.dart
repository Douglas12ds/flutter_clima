part of 'clima_bloc.dart';

abstract class ClimaEvent extends Equatable {
  const ClimaEvent();

  String get cidade => null;
}

class FetchClima extends ClimaEvent {
  final String cidade;

  const FetchClima({@required this.cidade}) : assert(cidade != null);

  @override
  List<Object> get props => [cidade];
}

class AtualizarClima extends ClimaEvent {
  final String cidade;

  const AtualizarClima({@required this.cidade}) : assert(cidade != null);
  @override
  List<Object> get props => [cidade];
}

