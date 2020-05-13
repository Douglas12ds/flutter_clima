part of 'configuracao_bloc.dart';

enum UnidadesTemperatura { fahrenheit, celsius }

 class ConfiguracaoState extends Equatable {
  final UnidadesTemperatura unidadesTemperatura;
  const ConfiguracaoState({@required this.unidadesTemperatura})
      : assert(unidadesTemperatura != null);

  @override
  List<Object> get props => [unidadesTemperatura];
}

class ConfiguracaoInitial extends ConfiguracaoState {
  @override
  List<Object> get props => [];
}
