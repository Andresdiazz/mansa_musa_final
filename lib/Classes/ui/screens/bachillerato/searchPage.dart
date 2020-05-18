import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {

    final NewAppBar = Container(
      width: double.infinity,
      height: 300,
      child: Row(
        children: [
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                style: TextStyle( color: Colors.white70 , fontSize: 15 ) ,
                decoration: InputDecoration(
                    labelText: "Email" ,
                    filled: true ,
                    fillColor: Colors.black38 ,
                    prefixIcon: Icon(
                      Icons.email ,
                      color: Colors.white38 ,
                    ) ,
                    labelStyle:
                    TextStyle( color: Colors.white38 , fontSize: 12 ) ,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular( 8 ) ,
                    ) ) ,
                keyboardType: TextInputType.emailAddress ,
                //autovalidate: true,
                autocorrect: false ,
                onSaved: (value) {
                  //email = value;
                } ,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Este campo es obligatorio';
                  }
                } ,
              ),
            ),
          ) ,
        ],
      ),
    );



    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          NewAppBar,
        ],
      ),
    );
  }
}


