import 'dart:async';
import 'dart:io';
import 'dart:ui';

//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/services.dart';


import 'package:shared_preferences/shared_preferences.dart';



import 'Timer.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main() async {

  //notifications personalizadas

  //fim das personalizações


  //fim do awesome notifications

  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  //await Firebase.initializeApp();

//FirebaseMessaging messaging = FirebaseMessaging.instance;

  // NotificationSettings settings = await messaging.requestPermission(
  //  alert: true,
  //  announcement: true,
  // badge: true,
  //  carPlay: true,
  // criticalAlert: true,
  //  provisional: true,
  //  sound: true,
  // );

  //pegando o token
  // String? token = await messaging.getToken(
  //vapidKey: "57027689",
  //);
  SharedPreferences prefs = await SharedPreferences.getInstance();


  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);

  runApp(

      const MyApp());
  // teste();
}

//notificações locais

Future selectNotification(String payload) async {
  //Handle notification tapped logic here
}

//teste () async{
//var a=0;
// Timer.periodic(const Duration(seconds: 5), (timer) async {
// print("contagem:$a");
//a+=1;
//if(a>=500){
//  a=0;
//}
//});
//}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desa',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Timer1(),
      //home: LoginPage(),
    );
  }
}
