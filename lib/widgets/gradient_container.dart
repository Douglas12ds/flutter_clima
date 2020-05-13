import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  Widget child;
  final MaterialColor cor;

  GradientContainer({Key key, @required this.cor, @required this.child})
      : assert(cor != null),
        assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 0.8, 1.0],
              colors: [cor[700], cor[500], cor[300]])),
      child: child,
    );
  }
}
