part of 'clima_bloc.dart';

abstract class ClimaState extends Equatable {
  const ClimaState();
}

class ClimaInitial extends ClimaState {
  @override
  List<Object> get props => [];
}

class ClimaVazio extends ClimaState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ClimaCarregando extends ClimaState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ClimaCarregado extends ClimaState {
  final Clima clima;

  const ClimaCarregado({@required this.clima}) : assert(clima != null);

  @override
  List<Object> get props => [clima];
}

class ClimaErro extends ClimaState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

