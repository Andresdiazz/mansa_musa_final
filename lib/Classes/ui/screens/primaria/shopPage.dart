import 'package:flutter/material.dart';
//import 'package:mansamusaapp/utils/globals.dart' as globals ;
import 'package:flutter/services.dart';
//import 'package:mercadopago_sdk/mercadopago_sdk.dart';



class Pago extends StatefulWidget {
  Pago({Key key}) : super(key: key);

  @override
  _PagoState createState() => _PagoState();
}

class _PagoState extends State<Pago> {

 /*  @override
  initState(){
const channelMercadoPagoRespuesta = const MethodChannel("betodt.com/mercadoPagoRespuesta");

channelMercadoPagoRespuesta.setMethodCallHandler((MethodCall call) async{
  switch(call.method){
    case 'mercadoPagoOk':
       var idPago = call.arguments[0];
       var status = call.arguments[1];
       var statusDetails = call.arguments[2];

       return mercadoPagoOk(idPago,status,statusDetails); 

    case 'mercadoError':
       var error = call.arguments[0]; 

       return mercadoPagoERROR(error); 


  }

});
    super.initState();
  }

  void mercadoPagoOk(idPago,status,statusDetails){
    print("idPago: $idPago");
    print("status: $status");
    print("statusDetails: $statusDetails");
  }

   void mercadoPagoERROR(error){
    print("Error: $error");

  }

  Future<Map<String, dynamic>> armarPreferencia() async {
   var mp = MP(globals.mpClientID,globals.mpClientSecret);
   var preference = {
     "items":[
      {
       "title": "Tarifa 1",
       "quantity": 1,
       "currency_id": "USD",
       "unit_price" : 20
      }   
     ],
     "payer":{"name":"Luis ALberto","email":"lucho.mix34@gmail.com"},
     "payment_methods":{
       "excluded_payment_types": [
         {"id":"ticket"},
         {"id":"atm"}
       ]
     }
   };

   var result = await mp.createPreference(preference);
   return result;
  }

  Future<Map<String, dynamic>> armarPreferencia2() async {
   var mp = MP(globals.mpClientID,globals.mpClientSecret);
   var preference = {
     "items":[
      {
       "title": "Tarifa 1",
       "quantity": 1,
       "currency_id": "USD",
       "unit_price" : 70
      }   
     ],
     "payer":{"name":"Luis ALberto","email":"lucho.mix34@gmail.com"},
     "payment_methods":{
       "excluded_payment_types": [
         {"id":"ticket"},
         {"id":"atm"}
       ]
     }
   };

   var result = await mp.createPreference(preference);
   return result;
  }

  Future<Map<String, dynamic>> armarPreferencia3() async {
   var mp = MP(globals.mpClientID,globals.mpClientSecret);
   var preference = {
     "items":[
      {
       "title": "Tarifa 1",
       "quantity": 1,
       "currency_id": "USD",
       "unit_price" : 120
      }   
     ],
     "payer":{"name":"Luis ALberto","email":"lucho.mix34@gmail.com"},
     "payment_methods":{
       "excluded_payment_types": [
         {"id":"ticket"},
         {"id":"atm"}
       ]
     }
   };

   var result = await mp.createPreference(preference);
   return result;
  }

  Future<void> tarifa1() async {
    armarPreferencia().then((result){
      if(result != null){
        var preferenceID = result['response']['id'];
        try{
          
          const channelMercadoPago = const MethodChannel("betodt.com/mercadoPago");
          final response = channelMercadoPago.invokeMethod(
            "mercadoPago",<String, dynamic> {
              "publicKey":globals.mpTestPublicKey,
              "preferenceId":preferenceID

          });
          print(response);
        } on PlatformException catch (e) {
          print(e.message);
        }
      }
    });
  }

  Future<void> tarifa2() async {
    armarPreferencia2().then((result){
      if(result != null){
        var preferenceID = result['response']['id'];
        try{
          
          const channelMercadoPago = const MethodChannel("betodt.com/mercadoPago");
          final response = channelMercadoPago.invokeMethod(
            "mercadoPago",<String, dynamic> {
              "publicKey":globals.mpTestPublicKey,
              "preferenceId":preferenceID

          });
          print(response);
        } on PlatformException catch (e) {
          print(e.message);
        }
      }
    });
  }

    Future<void> tarifa3() async {
    armarPreferencia3().then((result){
      if(result != null){
        var preferenceID = result['response']['id'];
        try{
          
          const channelMercadoPago = const MethodChannel("betodt.com/mercadoPago");
          final response = channelMercadoPago.invokeMethod(
            "mercadoPago",<String, dynamic> {
              "publicKey":globals.mpTestPublicKey,
              "preferenceId":preferenceID

          });
          print(response);
        } on PlatformException catch (e) {
          print(e.message);
        }
      }
    });
  }*/
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("images/logos/logo-blanco.png"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(child: Text("¡Suscribete y disfruta todo el contenido que tenemos para ti!", style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,)),
                ),
                RaisedButton(onPressed: (){},//tarifa1 ,
                child: Text("Adquiere 1 mes por \u0024 20.000", style: TextStyle(fontSize: 18),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  color: Colors.white,
                ),
                SizedBox(height: 10,),
                RaisedButton(onPressed: (){},//tarifa2,
                  child: Text("Adquiere 6 meses por \u0024 70.000", style: TextStyle(fontSize: 18),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  color: Colors.white,
                ),
                SizedBox(height: 10,),
                RaisedButton(onPressed: (){},//tarifa3,
                  child: Text("Aquiere 12 meses por \u0024 120.000", style: TextStyle(fontSize: 18),),
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
