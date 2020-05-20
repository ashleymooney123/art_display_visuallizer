
import 'package:art_display_visuallizer/1_Credentials/GoogleProfile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';




class GoogleSignApp extends StatefulWidget {
  @override
  _GoogleSignAppState createState() => _GoogleSignAppState();
}

class _GoogleSignAppState extends State<GoogleSignApp> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<String> getCurrentUID()async{
    return (await _firebaseAuth.currentUser()).uid;
  }

  Future<FirebaseUser> _signIn(BuildContext context) async {

    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in'),
    ));

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final authResult = await _firebaseAuth.signInWithCredential(credential);
    FirebaseUser userDetails = authResult.user;
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new GoogleProfileScreen(detailsUser: details),
      ),
    );
    return userDetails;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.height,
              child: Image.asset(
                  'images/gallery.jpg'
                  ,fit: BoxFit.cover,
                  color: Color.fromRGBO(255, 255, 255, 0.6),
                  colorBlendMode: BlendMode.modulate
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height:10.0),
                Container(
                  //  width: (MediaQuery.of(context).size.width) - ((MediaQuery.of(context).size.width)/4),
                  width: 275,
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xffffffff),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[

                            // Icon(FontAwesomeIcons.google,color: Color(0xffCE107C),),
                            SizedBox(width:35.0,
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Image.asset("images/google.jpg",
                                    width: 40, height: 40),
                              ),

                            ),
                            Text(
                              ' Sign in with Google',
                              style: TextStyle(color: Colors.black,fontSize: 18.0),
                            ),
                          ],),
                        onPressed: () => _signIn(context)
                            .then((FirebaseUser user) => print(user))
                            .catchError((e) => print(e)),
                      ),
                    )
                ),

                Container(
                    width: 275,
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xffffffff),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width:35.0,
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Image.asset("images/facebook.png",
                                    width: 40, height: 40),
                              ),
                            ),
                            Text(
                              ' Sign in with Facebook',
                              style: TextStyle(color: Colors.black,fontSize: 18.0),
                            ),
                          ],),
                        onPressed: () {},
                      ),
                    )
                ),
                Container(
                    width: 275,
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Color(0xffffffff),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[

                            SizedBox(width:35.0,
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Image.asset("images/gmail.ico",
                                    width: 40, height: 40),
                              ),

                            ),
                            Text(
                              ' Sign in with Email',
                              style: TextStyle(color: Colors.black,fontSize: 18.0),
                            ),
                          ],),
                        onPressed: () {},
                      ),
                    )
                ),
              ],
            ),
          ],
        ),),
    );
  }
}



class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
}


class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}