//import 'dart:html';

import 'package:art_display_visuallizer/1_Credentials/GoogleSignin.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:art_display_visuallizer/widgets/custom_dialog.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
   // final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Builder(
            builder: (context) => Stack(
                fit: StackFit.expand,
                children: <Widget>[
Container(

    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
            //  gradient: LinearGradient(colors: [Colors.blueGrey, Colors.white],
            begin: Alignment.center,
            end: Alignment.bottomRight)),
    height: MediaQuery.of(context).size.height,
    child: Image.asset(
        'images/gallery.jpg',
        fit: BoxFit.cover,
        color: Color.fromRGBO(255, 255, 255, 0.6),
        colorBlendMode: BlendMode.modulate),


    ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: _height *  0.10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: AutoSizeText("Welcome",
                        style: TextStyle(fontSize: 38, color: Colors.white),),
                      ),
                      SizedBox(
                        height: _height *  0.10,
                      ),
                      AutoSizeText("Lets View Some Art!",
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                      SizedBox(
height: _height *  0.10,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                          child: Text("Get Started",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,

                            color: Colors.black54,

                          ),
                          //  style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed: (){
                          showDialog(
                              context: context,
                          builder: (BuildContext context) => CustomDialog(
                            title: "Would you like to create a free account?" ,
                            description: "With an account, your data will be securely saved, allowing you to access it from multiple devices.",
                            primaryButtonText: "Create My Account",
                            primaryButtonRoute: "/signUp",
                            secondaryButtonText: "Maybe Later",
                            secondaryButtonRoute: "/home",
                          )
                          );
                        },
                      ),
                      SizedBox(
                        height: _height *  0.05,
                      ),
FlatButton(child: Text("Sign In", style: TextStyle(fontSize: 25,    color: Colors.black54,),

),
onPressed: (){
  Navigator.push(
    context,
    new MaterialPageRoute(
      builder: (context) => new GoogleSignApp(),
    ),
  );

},
),
                    ],
                  )
                ],
            ),
        ),
    );
  }
}
