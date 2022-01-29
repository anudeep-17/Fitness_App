import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stayfit/screens/Login_Screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayfit/screens/screen1.dart';



class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Stack(
        children: [
          Container(

            decoration: BoxDecoration(
              image: DecorationImage(

                image: AssetImage('assets/images/home2.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft
              )
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 1, sigmaY: 2
              ),
              child: Container(
                color: Colors.white.withOpacity(.123),
              ),
            ),
            ),

        Container
          (
          padding: EdgeInsets.fromLTRB(70.0,25.0,20.0,20.0),
          child: Text("ANIMAL",
          style: GoogleFonts.juliusSansOne(
              textStyle: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: <Shadow>[
                  Shadow(
                  offset: Offset(10.0, 10.0),
                  blurRadius: 20.0,
                  color: Colors.black,
                  ),
                  ],

              ),
          ),
            textAlign: TextAlign.center,
          ),

        ),

          Container
            (
            padding: EdgeInsets.fromLTRB(270.0,25.0,20.0,20.0),
            child: Text("FIT",
              style: GoogleFonts.juliusSansOne(
                  textStyle: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreenAccent,
                  ),
              ),
              textAlign: TextAlign.center,
            ),

          ),

          Container(
          padding: EdgeInsets.fromLTRB(20.0,500.0,20.0,20.0),
         child: Row(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
         const SizedBox(width: 10.0, height: 100.0),
          const Text(
            'Be',
            style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10.0, height: 100.0),
          DefaultTextStyle(

              style: GoogleFonts.quantico(textStyle: TextStyle(
                  fontSize: 40.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.lightGreenAccent)),

            child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText('AWESOME'),
                  FadeAnimatedText('UNIQUE'),
                  FadeAnimatedText('DIFFERENT'),
                  TyperAnimatedText('IN LOVE OF IRON :)', textStyle: TextStyle(fontSize: 30.0)),
                ],
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Loginpage()));
          },
              isRepeatingAnimation: true,
          ),
        ),
        ],
      ),),

        Positioned(
        bottom: 20,
        left: 30,
        right: 30,
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Loginpage())),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10 ),
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children:[

          Text('GET STARTED',
            style: GoogleFonts.juliusSansOne(textStyle: TextStyle(fontSize: 22.0, color: Colors.black )),
              textAlign: TextAlign.center,
          ),
          Icon(Icons.chevron_right, size: 20.0, color: Colors.black,),
        ],
       ),
      ),
      ),
      ),
    ],
    ),
    );
  }

}