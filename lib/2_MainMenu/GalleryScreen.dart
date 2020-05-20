


import 'package:art_display_visuallizer/3_PhotoUploadMethods/DefaultPhotoSelectionLists.dart';
import 'package:art_display_visuallizer/3_PhotoUploadMethods/UserPhotoUpload.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Pick a Room Layout"),
      ),
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
              child: Image.network(
                  'https://static.wixstatic.com/media/c2695d_20635205491f46d1a51a599778f0c8ff~mv2.jpg/v1/fill/w_404,h_538,al_c,lg_1,q_80/c2695d_20635205491f46d1a51a599778f0c8ff~mv2.webp',
                  fit: BoxFit.cover,
                  color: Color.fromRGBO(255, 255, 255, 0.6),
                  colorBlendMode: BlendMode.modulate),

            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CameraSnackBarPage(),

//                    RawMaterialButton(
//                      elevation: 2.0,
//                      fillColor: Colors.white70,
//                      child:
//                      Icon(
//                        FontAwesomeIcons.cameraRetro,
//                        color: Colors.blueGrey,
//                        size: 70.0,
//                      ),
//                      onPressed: () {
//
//                      },
//                      shape: CircleBorder(),
//                    ),
                ),
                Expanded(
                  child: FolderSnackBarPage(),
//                    RawMaterialButton(
//                      elevation: 2.0,
//                      fillColor: Colors.white70,
//                      child:
//                      Icon(
//                        FontAwesomeIcons.folderOpen,
//                        color: Colors.blueGrey,
//                        size: 70.0,
//                      ),
//                      onPressed: () {},
//                      shape: CircleBorder(),
//                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CameraSnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RawMaterialButton(
          shape: CircleBorder(),
          elevation: 2.0,
          fillColor: Colors.white70,
          child: Icon(
            FontAwesomeIcons.cameraRetro,
            color: Colors.blueGrey,
            size: 70.0,
          ),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new CameraScreen(),
                ));

//          final snackBar = SnackBar (
//            content: Text('Take an Interior Photo'),
//           action:
//              SnackBarAction(
//                  label: 'Undo',
//              onPressed: (){
//                _CameraScreenState();
//             //   ImageCapture();
//              }
//          ),
//          );
//          Scaffold.of(context).showSnackBar(snackBar);
          }),
    );
  }
}
//
//class FileSnackBarPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: RawMaterialButton(
//          shape: CircleBorder(),
//          elevation: 2.0,
//          fillColor: Colors.white70,
//          child: Icon(
//            FontAwesomeIcons.fileUpload,
//            color: Colors.blueGrey,
//            size: 70.0,
//          ),
//          onPressed: () {
//            final snackBar = SnackBar (
//              content: Text('Upload an Image from your Phone'),
//              action:
//              SnackBarAction(
//                  label: 'Undo',
//                  onPressed: (){
//
//                  }
//              ),
//            );
//            Scaffold.of(context).showSnackBar(snackBar);
//          }
//      ),
//    );
//  }
//}

class FolderSnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RawMaterialButton(
        shape: CircleBorder(),
        elevation: 2.0,
        fillColor: Colors.white70,
        child: Icon(
          FontAwesomeIcons.folderOpen,
          color: Colors.blueGrey,
          size: 70.0,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InteriorScrollView()));
        },
      ),
    );
  }
}
