import 'package:flutter/material.dart';
import 'model/clases_model_primaria.dart';


class SecondPagePrimaria extends StatefulWidget {

  final CardsPrimaria card;

  SecondPagePrimaria({this.card});

  @override
  _SecondPagePrimariaState createState() => _SecondPagePrimariaState();
}

class _SecondPagePrimariaState extends State<SecondPagePrimaria> {
  @override
  Widget build(BuildContext context) {

    final String port = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Hero"),
      ),
      body: Column(
        children: [
          Container(
            height: 190,
              width: double.infinity,
              child: Image.network(widget.card.imageUrl, fit: BoxFit.cover,)),
          Text(widget.card.title)
        ],
      ),
    );
  }
}
