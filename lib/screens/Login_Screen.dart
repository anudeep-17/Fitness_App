import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stayfit/screens/screen1.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stayfit/screens/signup.dart';

class Loginpage extends StatefulWidget
{
  const Loginpage({Key?key}) : super(key: key);


  Loginpagestate createState() => Loginpagestate();
}


class Loginpagestate extends State<Loginpage>
{

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

    final loginbutton = Material(
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
          signin(emailController.text, passwordController.text);
        },
        child: Text('LOGIN', textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            )),
      ),
    );

    final loginwithgoogle = Row(
      children:<Widget>[

        Container(
          // color: Colors.lightGreenAccent,
          padding: EdgeInsets.only(left: 77.0),
          child: SignInButton(
            Buttons.Google,
            text: "sigin with Google",
            onPressed: (){signinwithgoogle(context);},
          ),
        ),
      ],
    );

    final forgotpassword = GestureDetector(
      onTap: () {
        var value = emailController.text;
        if(value.isEmpty)
          {
            Fluttertoast.showToast(msg: "please enter your email");
          }
        else {
          if (checkIfEmailInUse(value) == true)
          {
            Fluttertoast.showToast(
                msg: "please check your email for instructions");
            resetPassword(emailController.text);
          }
          else
            {
              Fluttertoast.showToast(
                  msg: "please check your email, no result found");
            }
        }
      },

      child: Container(
        alignment: Alignment(1.0,0.0),
        padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 5.0 ),
        child:InkWell(
          child:Text(
            "Forgot Password",
            style: GoogleFonts.roboto(
              fontSize: 11.0,
              color: Colors.lightGreenAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );



    
    final needtoregister = Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 75.0),
        ),
        Text("Want to join the beasts ?", textAlign: TextAlign.center,),
        SizedBox(width: 5.0),
        InkWell(
          onTap: ()
          {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => signup()));

          },
          child: Text("Register",
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
          padding: const EdgeInsets.only(left:25.0, right: 25.0),
              child: Container(
                child: Form(
                  key: formkey,
                  child: Container(
                          child: ListView(
                          children: [
                            Container(
                              height:250,
                              width: 200,
                              // SizedBox(height: 50.0),
                               padding: EdgeInsets.fromLTRB(0.0, 55.0, 0,0),
                              child: Stack(
                                children: [
                                Text(
                                "HELLO",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 80.0,
                                ),
                              ),
                                  Positioned(
                                    top:60,
                                    child:Text(
                                      "There!",
                                      style: GoogleFonts.bebasNeue(
                                        fontSize: 80.0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 121,
                                    left: 155,
                                    child: Container(
                                      height: 13,
                                      width: 13,
                                      // padding: EdgeInsets.fromLTRB(200, 97.0, 0,0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.lightGreenAccent,
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                            emailfield,
                            SizedBox(height: 5),
                            passwordfield,
                            forgotpassword,
                            SizedBox(height: 20),
                            loginbutton,
                            SizedBox(height: 5.0),
                            loginwithgoogle,
                            SizedBox(height: 80.0),
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


  void signin(String email, String password) async {
    if (formkey.currentState!.validate()) {
     await auth.signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
      {
        Fluttertoast.showToast(
          msg: "Login Succesful", toastLength: Toast.LENGTH_SHORT,),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => screen1())),

      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }

  }

  Future<void>  signinwithgoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => screen1()));
      }  // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }





  void signout()
  async{
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            builder: (context) =>
            new Loginpage()),
            (Route<dynamic> route) => false);
    await auth.signOut();

  }

  @override
  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

// Returns true if email address is in use.
  Future<bool> checkIfEmailInUse(String emailAddress) async {
    try {
      // Fetch sign-in methods for the email address
      final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);

      // In case list is not empty
      if (list.isNotEmpty) {
        // Return true because there is an existing
        // user using the email address
        return true;
      } else {
        // Return false because email adress is not in use
        return false;
      }
    } catch (error) {
      // Handle error
      // ...
      return true;
    }
  }


}