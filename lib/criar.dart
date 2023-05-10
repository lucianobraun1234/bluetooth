import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '/Background/Widget.dart';
import 'configurar.dart';

class Inicio extends  StatefulWidget  {
  @override
  State<Inicio> createState() => _Inicio();
}
//pagina 171 pegar a listview
class _Inicio extends State<Inicio> {


  var lista = [];
  var lista1 = [];

  get app => null;
  var connection1;
  String cima='';
  String baixo='';
  String esquerda='';
  String direita='';

  final yourScrollController = ScrollController();


  void initState() {
    super.initState();

    _asyncMethod();
  }

  _asyncMethod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //prefs.setString('credenciais',resultado2);
    var cima1 = prefs.getString('cima');
    var baixo1 = prefs.getString('baixo');
    var esquerda1 = prefs.getString('esquerda');
    var direita1 = prefs.getString('direita');
    if (cima1 != null) {
      cima = cima1;
    }
    else {
      cima = '';
    }
    if (baixo1 != null) {
      baixo= baixo1;
    }
    else {
      baixo = '';
    }
    if (esquerda1 != null) {
      esquerda = esquerda1;
    }
    else {
      esquerda = '';
    }
    if (direita1 != null) {
      direita= direita1;
    }
    else {
      direita = '';
    }
  }



  _start(){
    return Container();
  }



  @override
  Widget build(BuildContext context) {


    return Stack(children: [
      //BackgroundImage1(),
     // BackgroundImage(),

      Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,

        //backgroundColor: Colors.white,
        body:
        Container(

            child:
            SingleChildScrollView(

              child:
              Center(

                child:
                Column(
                    children: [
                      SizedBox(height:100),
                      //definindo a margem superior do apk

                      Container(
                        //password

                        //width: 120,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child:
                            Row(
                              children:[
                                SizedBox(width:40),
                                Container(
                                  //password


                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child:
                                  TextButton(onPressed: () async{
                                    if(connection1!=null){
                                      connection1.finish();

                                    }
                                    //função do botão
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>Configurar()));



                                  }

                                      , child: Text('Config', style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white.withOpacity(0.8)))


                                  ),
                                ),
                                SizedBox(width:50),
                                Container(
                                  //password


                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child:
                                  TextButton(onPressed: () async {
                                    //função do botão

                                    // To get the list of paired devices
                                    try {
                                      // Start scanning
                                      // Start scanning
                                      setState(() {
                                        lista=[];
                                        lista1=[];
                                      });
                                      List<BluetoothDevice> devices =
                                      await FlutterBluetoothSerial.instance.getBondedDevices();

                                      // Connect to the first device in the list
                                      var b;
                                      var c;
                                      var d;
                                      for(int i=0;i<devices.length;i++){
                                        c=devices[i].name.toString();
                                        d=devices[i].address.toString();
                                      b=devices[i].name.toString()+'  '+ devices[i].address.toString();
                                      print("endereco:$b");
                                      setState(() {
                                        lista.add(c);
                                        lista1.add(d);
                                      });
                                      }




                                    } catch(e) {
                                      print("Erro:$e");
                                    }
                                    Modalbluetooth( context);




                                  }

                                      , child: Text('Bluetooth', style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white.withOpacity(0.8)))


                                  ),
                                ),
                                SizedBox(width:50),
                                Container(
                                  //password


                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child:
                                  TextButton(onPressed: () {
                                    //função do botão
                                    if(connection1!=null){
                                      connection1.finish();
                                      Alerta().alerta1(context,'Aparelho','desconectado');
                                    }
                                    Alerta().alerta1(context,'Sem','conexão');


                                  }

                                      , child: Text('Descon', style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white.withOpacity(0.8)))


                                  ),
                                ),

                              ]
                            ),),


                      SizedBox(
                        height:50,
                      ),
                      Center(
                        child:
                        IconButton(
                          tooltip:"frente",
                          color: Colors.black,
                          iconSize: 100,
                          onPressed:() async {
                            if(connection1!=null){
                              connection1.output.add(utf8.encode(cima));
                              await connection1.output.allSent;
                            }



                          }, icon: const Icon(Icons.arrow_circle_up),)
                      ),
                      SizedBox(height:20),
                      Center(
                        child:
                          Row(
                            children:[
                              SizedBox(width:40),
                              IconButton(
                                tooltip:"esquerda",
                                color: Colors.black,
                                iconSize: 100,
                                onPressed:() async {
                                  if(connection1!=null){
                                    connection1.output.add(utf8.encode(esquerda));
                                    await connection1.output.allSent;
                                  }


                                }, icon: const Icon(Icons.arrow_circle_left_outlined),),
                              SizedBox(width:70),
                              IconButton(
                                tooltip:"direita",
                                color: Colors.black,
                                iconSize: 100,
                                onPressed:() async {
                                  if(connection1!=null){
                                    connection1.output.add(utf8.encode(direita));
                                    await connection1.output.allSent;
                                  }


                                }, icon: const Icon(Icons.arrow_circle_right_outlined),),

                            ]

                          ),

                      ),
                      SizedBox(height:20),
                      Center(
                          child:
                          IconButton(
                            tooltip:"tras",
                            color: Colors.black,
                            iconSize: 100,
                            onPressed:() async {
                              if(connection1!=null){
                                connection1.output.add(utf8.encode(baixo));
                                await connection1.output.allSent;
                              }


                            }, icon: const Icon(Icons.arrow_circle_down_rounded),)
                      ),












                    ]
                ),),)
        ),)

      ,
      WillPopScope(
          onWillPop: () async {

            print('Press again Back Button exit');

            // showAlertDialog(context);

            // print('sign out');
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>Timer2()));

            return true;

          },
          child: Container(
            alignment: Alignment.center,
            child: Text(''),
          ))
    ]);
  }
  Modalbluetooth(BuildContext context)
  async {
    // Start scanning

    // configura o button
    Widget okButton =
    Scrollbar(
        thumbVisibility: true,
        controller: yourScrollController,
        child:
      Column(
          children:[
            Container(
                width:MediaQuery.of(context).size.width*8/10,
                height:MediaQuery.of(context).size.height/3,
              child:ListView.builder(
        // scrollDirection: Axis.horizontal,
                controller: yourScrollController,
                 scrollDirection: Axis.vertical,
            itemCount: lista.length,
           itemBuilder: (context, i) {
             return
             Container(
               child:
               TextButton(onPressed: () async {
                 //função do botão

                 try{
                   var address=lista1[i];
                   BluetoothConnection connection = await BluetoothConnection.toAddress(address);
                   setState(() {
                     connection1=connection;
                   });
                   Navigator.pop(context);
                   Alerta().alerta1(context,'funcionou','conectado');

                   print('Connected to the device');
                 }
                 catch(e){
                   print('erro');
                   Alerta().alerta1(context,'Erro',e.toString());

                 }


               },


                   child: Text('conectar ao  '+lista[i].toString(),
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 16,
                           color: Colors.black
                               .withOpacity(1)))

             ),);


           },),


            ),
            Row(
                children:[
                  TextButton(
                    child: Text("Fechar"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ]
            )

          ]
      )
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text(" "),
      content: Text(" "),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }



}

class Alerta{

  void alerta1(BuildContext context,String titulo,String mensagem)
  {
    // configura o button

    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text(titulo),
      content: Text(mensagem),
      actions: [

      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

}











