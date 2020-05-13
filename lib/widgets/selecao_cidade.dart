import 'package:flutter/material.dart';

class SelecaoCidade extends StatefulWidget {
  @override
  _SelecaoCidadeState createState() => _SelecaoCidadeState();
}

class _SelecaoCidadeState extends State<SelecaoCidade> {
  final TextEditingController _cidadeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cidade")),
      body: Form(
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: _cidadeController,
                decoration:
                    InputDecoration(labelText: 'Cidade', hintText: 'Salvador'),
              ),
            )),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.pop(context, _cidadeController.text);
                })
          ],
        ),
      ),
    );
  }
}

/*

            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
*/
