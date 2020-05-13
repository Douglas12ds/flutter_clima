part of 'configuracao_bloc.dart';

abstract class ConfiguracaoEvent extends Equatable {
  const ConfiguracaoEvent();
}

class UnidadeDeTemperaturaAlterada extends ConfiguracaoEvent {
  @override
  List<Object> get props => throw UnimplementedError();
  
}
