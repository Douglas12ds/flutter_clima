part of 'tema_bloc.dart';

class TemaState extends Equatable {
  final ThemeData tema;
  final MaterialColor cor;

  const TemaState({@required this.tema, @required this.cor})
      : assert(tema != null),
        assert(cor != null);

  @override
  List<Object> get props => [tema, cor];
}

class TemaInitial extends TemaState {
  @override
  List<Object> get props => [];
}
