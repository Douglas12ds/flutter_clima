import 'package:flutter/material.dart';

class Localidade extends StatelessWidget {
  final String localidade;

  Localidade({Key key, @required this.localidade})
      : assert(localidade != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      localidade,
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}