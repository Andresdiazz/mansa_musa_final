import 'package:flutter/material.dart';

import 'model/clases_model_preescolar.dart';


class SecondPagePreescolar extends StatefulWidget {

  final CardsPreescolar card;

  SecondPagePreescolar({this.card});

  @override
  _SecondPagePreescolarState createState() => _SecondPagePreescolarState();
}

class _SecondPagePreescolarState extends State<SecondPagePreescolar> {
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
