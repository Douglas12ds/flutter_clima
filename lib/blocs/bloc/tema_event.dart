part of 'tema_bloc.dart';

abstract class TemaEvent extends Equatable {
  const TemaEvent();
}

class ClimaAlterado extends TemaEvent {
  final CondicaoClimatica condicaoClimatica;

  const ClimaAlterado({@required this.condicaoClimatica})
      : assert(condicaoClimatica != null);

  @override
  // TODO: implement props
  List<Object> get props => [condicaoClimatica];
}
