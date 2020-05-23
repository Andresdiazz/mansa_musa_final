import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compra tu membresía"),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RaisedButton(onPressed: (){},
                child: Text("Para tu mes por \u0024 20.000", style: TextStyle(fontSize: 20),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  color: Colors.white,
                ),
                RaisedButton(onPressed: (){},
                  child: Text("Adquiere 6 meses por \u0024 70.000", style: TextStyle(fontSize: 20),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  color: Colors.white,
                ),
                RaisedButton(onPressed: (){},
                  child: Text("Aquiere el año por \u0024 120.000", style: TextStyle(fontSize: 20),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
