
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stayfit/dashboard.dart';
import 'package:stayfit/screens/Login_Screen.dart';

class screen1 extends StatefulWidget
{
  const screen1({Key?key}) : super(key: key);


  screen1state createState() => screen1state();
}

class screen1state extends State<screen1>
{
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
  return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      backgroundColor: Colors.black,
      title: Text('ANIMALFIT', style: GoogleFonts.juliusSansOne(textStyle: TextStyle(color: Colors.lightGreenAccent)),),
      actions: [
        Theme(data: Theme.of(context).copyWith(dividerColor: Colors.lightGreenAccent),

        child: PopupMenuButton<int>(color: Colors.black, itemBuilder: (context) => [

          PopupMenuItem<int>(
            value: 0,

              child: Row(
                children:[
                  Icon(Icons.person, color: Colors.lightGreenAccent),
                  Text("Your Profile", style: GoogleFonts.roboto(textStyle: TextStyle(color:Colors.white)),),
              ],
              ),
          ),

          PopupMenuDivider(),


          PopupMenuItem<int>(
            value: 1,
            child:Row(
              children:[
                Icon(Icons.logout, color: Colors.lightGreenAccent),
                Text("logout", style: GoogleFonts.roboto(textStyle: TextStyle(color:Colors.white)),),
              ],
            ),
          ),
        ],onSelected: (item) => SelectedItem(context, item),


        ),

        ),
      ],


      elevation: 60.0,
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   onPressed: () {  },
      // ),
    ),

    bottomNavigationBar: new Theme(
    data: Theme.of(context).copyWith(

    ),

      child: ClipRRect(
    borderRadius: BorderRadius.vertical(top: Radius.circular(40)),

    child: BottomNavigationBar(
      iconSize: 30,
      selectedIconTheme: IconThemeData(
        color: Colors.white,

      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.lightGreenAccent,

      ),
      items: [


      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home'
      ),

        BottomNavigationBarItem(icon: Icon(
          Icons.search,
        ),
            label: 'Search'
        ),


        BottomNavigationBarItem(icon: Icon(
        Icons.person,
      ),
         label: 'Profile'
      ),


    ],
      // selectedLabelStyle: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w200, fontSize: 16)),
      selectedItemColor: Colors.lightGreenAccent,
      // unselectedLabelStyle: GoogleFonts.openSans(textStyle: TextStyle(fontWeight: FontWeight.w500)),
      unselectedItemColor: Colors.white54,
      showSelectedLabels: false,
      showUnselectedLabels: false,

    ),
    ),
    ),
    
    body: Stack(
      children: <Widget>[
        Positioned(
          top: 0,
            height: height*0.30,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: const Radius.circular(40),),
              child: Container(
                color: Colors.lightGreenAccent,
              ),
            ),
          ),
        Positioned(
          top: height*0.34,
          height: height*0.6,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.black,
            height: height*0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 32, right: 16),
                      child: Text('Dashboard', style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.lightGreenAccent, fontSize: 15, fontWeight: FontWeight.w200)),),

                    ),

                    Expanded(child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(

                        children: <Widget>[
                          SizedBox(width: 32,),
                          for(int i = 0; i < dashboard_content.length; i++)
                              dashboardcard(dashboard_content: dashboard_content[i],),
                        ],
                      ),

                    ),
                    ),
                    SizedBox(height: 20,),

                    Expanded(
                      child: Container(
                      margin: const EdgeInsets.only(bottom: 20, left: 32, right: 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color.fromRGBO(0,0,0, 5),
                            const Color.fromRGBO(178,255,89, 5),
                            const Color.fromRGBO(178,255,89, 5),
                            const Color.fromRGBO(178,255,89, 5),
                            // const Color(),
                          ],
                        ),
                      ),
                        child: Column(
                          children: <Widget>[
                            Text("YOUR NEXT WORKOUT CORNER", style: GoogleFonts.bebasNeue(fontWeight: FontWeight.w100, fontSize: 15), textAlign: TextAlign.center,),
                            Row(
                              children: <Widget>[
                                SizedBox(width: 32,),
                                IconButton(onPressed: (){}, icon: Image.asset("assets/images/fullbody.png"), iconSize: 20,),
                                IconButton(onPressed: (){}, icon:Image.asset("assets/images/arms.png"), iconSize: 20,),
                                IconButton(onPressed: (){}, icon: Image.asset("assets/images/back.png"), iconSize: 20,),
                                IconButton(onPressed: (){}, icon: Image.asset("assets/images/legs.png"), iconSize: 20,),
                                IconButton(onPressed: (){}, icon: Image.asset("assets/images/core.png"), iconSize: 20,),
                                IconButton(onPressed: (){}, icon: Image.asset("assets/images/love4.png"),iconSize:20,),                              ],
                            ),
                            Container(
                              child: DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  FadeAnimatedText('"Dont workout religiously...... about twice a year around holidays:)"',
                                     textStyle: GoogleFonts.bebasNeue(), duration: Duration(seconds: 5), fadeOutBegin: 0.9,fadeInEnd: 0.7),
                                  FadeAnimatedText('"Chest day ?...... get ready to get that weight off your chest !!"',
                                      textStyle: GoogleFonts.bebasNeue(), duration: Duration(seconds: 5), fadeOutBegin: 0.9,fadeInEnd: 0.7),
                                  FadeAnimatedText('"A ghost''s favorite workout is easy to guess. It is definitely dead lifts"',
                                      textStyle: GoogleFonts.bebasNeue(), duration: Duration(seconds: 5), fadeOutBegin: 0.9,fadeInEnd: 0.7),
                                  FadeAnimatedText('"U Cant spell Legendary without a "LEG DAY""',
                                      textStyle: GoogleFonts.bebasNeue(), duration: Duration(seconds: 5), fadeOutBegin: 0.9,fadeInEnd: 0.7),
                                ],
                                onTap: () {
                                  print("Tap Event");
                                },
                                isRepeatingAnimation: true,

                                // repeatForever: true,
                              ),
                            ),
                            ),
                          ],
                        ),
                    ),),


                  ],

            ),
          )
        ),

      ],

    ),

  );
  }




  void signout()
  async{
    if(auth.currentUser != null) {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (context) =>
              new Loginpage()),
              (Route<dynamic> route) => false);
      await auth.signOut();
    }
  }

  SelectedItem(BuildContext context, Object? item) {
    switch(item)
    {
      case 0: print('navigate to profile page'); break;
      case 1: signout();break;

    }
  }
}



class dashboardcard extends StatelessWidget{

  final dashboard dashboard_content;

  const dashboardcard({Key? key, required this.dashboard_content}): super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 10),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max ,
          children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(dashboard_content.imagepath,
                      width: 150,
                      fit: BoxFit.fill,
                    ),

                  ),
               ),
              Flexible(
                  fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dashboard_content.name, style: GoogleFonts.bebasNeue(textStyle: TextStyle(fontWeight: FontWeight.w100 , fontSize: 21, color: Colors.lightGreenAccent),),),
                    Text(dashboard_content.description, style: GoogleFonts.bebasNeue(textStyle: TextStyle(fontWeight: FontWeight.w200 , fontSize: 12.5, color: Colors.white),),),
                    Text(dashboard_content.extended, style: GoogleFonts.bebasNeue(textStyle: TextStyle(fontWeight: FontWeight.w200 , fontSize: 12, color: Colors.white),),),

                    SizedBox(height: 30,),
                  ],
                ),
                ),
              )

             ],
        ),
      ),
    );
  }

}