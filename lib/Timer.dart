import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Background/Widget.dart';
import 'criar.dart';




//import 'package:firebase_messaging/firebase_messaging.dart';


class Timer1 extends  StatefulWidget  {
  @override
  State<Timer1> createState() => _Timer1();
}
//pagina 171 pegar a listview
class _Timer1 extends State<Timer1> {
  var imagem;

  var tempo;
  bool verificacao=false;
  String base64="";
  List valores=[];
  var decide;
  String texto="";
  double tamanho=10;
  showAlertDialog10(BuildContext context) {
    // configura o button
    Widget okButton =  TextButton(
      child: Text("ok"),
      onPressed: () {
        Navigator.pop(context);
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>LoginPage()));
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Recebeu uma mensagem"),
      content: Text("mensage"),
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

  @override
  void initState () {
    super.initState();
    _asyncMethod();
    Future.delayed(Duration(milliseconds: 500)).then((value) => setState(() {
      tamanho = MediaQuery.of(context).size.height*2/10;

    }));


  }


  @override
  Widget build(BuildContext context) {


    return Stack(children: [
      //BackgroundImage1(),
      BackgroundImage5(),

      Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,

        //backgroundColor: Colors.white,
        body:
        Container(

            child:
            SingleChildScrollView(

              child:
             Column(
               children:[
              AnimatedContainer(
                duration: Duration(seconds: 3),
                height:tamanho,
                width:MediaQuery.of(context).size.width,
              ),
                 Container(
                   height:MediaQuery.of(context).size.height/2,
                   width:MediaQuery.of(context).size.width,

                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage('img/carro_sonic.jpg'),
                         //fit:BoxFit.cover,


                       ),
                 ),)
               ,
                 Text(
                    texto,
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 18,
                         color: Colors.blueGrey
                             .withOpacity(1)))
               ]

              ),
        ),),)


      ,WillPopScope(
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


  void  _asyncMethod() async{
    //baixar as imagens e salvar elas no banco de dados


      //pegando o fundo1
    print("entrando aqui");
     // var  imgUrl1='https://amejardins.com.br/gerenciamento/app/imagens/jardins1.jpg';
    //var imgUrl2='https://amejardins.com.br/gerenciamento/app/imagens/jardins2.jpg';
    //var imgUrl4='https://amejardins.com.br/gerenciamento/app/imagens/jardins3.jpg';
    //var imgUrl3='https://amejardins.com.br/gerenciamento/app/imagens/logo_grande.png';
    //valores.add(imgUrl1);
    //valores.add(imgUrl2);
    //valores.add(imgUrl3);
    //valores.add(imgUrl4);
    Future.delayed(Duration(milliseconds: 4000)).then((value) => setState(() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>Inicio()));

    }));











    }





  showAlertDialog11(BuildContext context) {
    // configura o button
    Widget okButton =  TextButton(
      child: Text("ok"),
      onPressed: () {
        Navigator.pop(context);
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>LoginPage()));
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Recebeu uma mensagem"),
      content: Text("mensage"),
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












