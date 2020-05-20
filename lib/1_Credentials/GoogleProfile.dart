
import 'package:art_display_visuallizer/1_Credentials/GoogleSignin.dart';
import 'package:art_display_visuallizer/2_MainMenu/GalleryScreen.dart';
import 'package:art_display_visuallizer/7_UserUpload/UserInput.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleProfileScreen extends StatelessWidget {
  final UserDetails detailsUser;

  GoogleProfileScreen({Key key, @required this.detailsUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _gSignIn = GoogleSignIn();

    return Scaffold(
      appBar: AppBar(
        title: Text(detailsUser.userName),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.signOutAlt,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: () {
              _gSignIn.signOut();
              print('Signed out');
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body:
      Center(
        // child: Image.network("https://abbozzogallery.com/abb18/wp-content/uploads/2019/08/wide-angle-gallery-collective-remix.jpg"),


        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(detailsUser.photoUrl),
              radius: 50.0,
            ),
            SizedBox(height: 10.0),
            Text(
              // "Name : " + detailsUser.userName,
              detailsUser.userName,
              style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              //"Email : " + detailsUser.userEmail,
              detailsUser.userEmail,
              style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
               "Provider : " + detailsUser.providerDetails,

              style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 20.0),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                width: 200,
                child:
                RaisedButton(

                  shape: RoundedRectangleBorder(

                    borderRadius: new BorderRadius.circular(10.0),

                  ),
                  color: Color(0xffffffff),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //  Icon(FontAwesomeIcons.play,color: Color(0xffCE107C),),

                      Text(
                        'View Artwork',
                        style: TextStyle(
                            color: Colors.blueGrey, fontSize: 20.0),
                      ),
                    ],),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => GalleryScreen()));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                width: 200,
                child:
                RaisedButton(

                  shape: RoundedRectangleBorder(


                    borderRadius: new BorderRadius.circular(10.0),

                  ),
                  color: Color(0xffffffff),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //  Icon(FontAwesomeIcons.play,color: Color(0xffCE107C),),

                      Text(
                        'Display Artwork',
                        style: TextStyle(
                            color: Colors.blueGrey, fontSize: 20.0),
                      ),
                    ],),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => UserMainScreen())); //ArtistsHome
                    //  builder: (context) => ArtistsHome()));
                  },
                ),
              ),
            ),

          ],
        ),


      ),

    );
  }
}

