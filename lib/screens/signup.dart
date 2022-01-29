
import 'dart:async';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayfit/screens/Login_Screen.dart';


class signup extends StatefulWidget{
  @override
  signuppage createState() => signuppage();
}

class signuppage extends State<signup> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    final emailfield = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter your email';
        }

        if (!EmailValidator.validate(value)) {
          return 'please enter a valid email';
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'EMAIL',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreenAccent),
        ),
      ),
    );


    final passwordfield = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,

      validator: (value) {
        String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regExp = new RegExp(pattern);

        if (value!.isEmpty) {
          return 'please enter your password';
        }

        if (!regExp.hasMatch(value)) {
          return 'please enter a valid password';
        }
        return null;
      },

      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.password),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreenAccent),
        ),
      ),
    );

    final signupbutton = Material(
      elevation: 7,
      borderRadius: BorderRadius.circular(30),
      color: Colors.lightGreenAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        onPressed: () {
          signup(emailController.text, passwordController.text);
        },
        child: Text('SIGNUP', textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            )),
      ),
    );


    final needtoregister = Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 140.0),
        ),
        Icon(Icons.chevron_left, size: 20.0, color: Colors.lightGreenAccent,),
        SizedBox(width: 5.0),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Loginpage()));
          },
          child: Text("Go Back",
            style: GoogleFonts.roboto(
              color: Colors.lightGreenAccent,
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.center,
          ),

        ),
      ],
    );


    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(

                    image: AssetImage('assets/images/home4.jpg'),
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
            ),),


          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Container(
              child: Form(
                key: formkey,
                child: Container(
                  child: ListView(
                    children: [
                      Container(
                        height: 250,
                        width: 200,
                        // SizedBox(height: 50.0),
                        padding: EdgeInsets.fromLTRB(1.0, 55.0, 0, 0),
                        child: Stack(
                          children: [
                            DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 70.0,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.lightGreenAccent,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  FlickerAnimatedText('Yooooo...Hoooo',
                                      textStyle: GoogleFonts.bebasNeue()),
                                  FlickerAnimatedText('Yooooo...Hoooo',
                                      textStyle: GoogleFonts.bebasNeue()),
                                ],
                                repeatForever: true,
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            ),
                            Positioned(
                              top: 70,
                              child: Text(
                                "Its time to turn..... ",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 40.0,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 102,
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 40.0,
                                ),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText('into a beast',
                                        textStyle: GoogleFonts.bebasNeue()),
                                    TyperAnimatedText('into a beast',
                                        textStyle: GoogleFonts.bebasNeue()),
                                  ],
                                  onTap: () {
                                    print("Tap Event");
                                  },
                                  isRepeatingAnimation: false,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      emailfield,
                      SizedBox(height: 5),
                      passwordfield,
                      SizedBox(height: 20),
                      signupbutton,
                      SizedBox(height: 70.0),
                      needtoregister,

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> signup(String email, String password) async{
    if (formkey.currentState!.validate())
    {
     UserCredential user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password));

      try
      {
       await user.user?.sendEmailVerification();
       if(user.user!.emailVerified)
         {
         Fluttertoast.showToast(
      msg: "welcome beast:)", toastLength: Toast.LENGTH_SHORT,);
          Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Loginpage()));
      }
      }catch(e) {
        Fluttertoast.showToast(msg: e.toString());
      };
    }
  }


}
