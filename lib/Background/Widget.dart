import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BackgroundImage5 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var blendMode;

    return ShaderMask(


      shaderCallback: ( bounds)=>LinearGradient(
        colors: [Colors.black.withOpacity(0),Colors.white],
        begin:Alignment.bottomCenter,
        end:Alignment.center,
      ).createShader(bounds),
      blendMode:BlendMode.lighten,
      child:Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(1),
          // image: DecorationImage(
          //image: AssetImage('images/branco.png'),
          // fit:BoxFit.cover,
          //  colorFilter: ColorFilter.mode(Colors.white54.withOpacity(0.8),BlendMode.darken),


          // ),
        ),
      ),

    );
  }
}
