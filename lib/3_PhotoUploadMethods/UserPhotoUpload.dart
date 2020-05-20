
import 'dart:io';
import 'package:art_display_visuallizer/3_PhotoUploadMethods/UserImageArtworkSelectionList.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CameraScreen extends StatefulWidget {
  @override

  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File _imageFile;
  bool _uploaded = false;
  String _downloadURL;
  StorageReference _reference = FirebaseStorage.instance.ref().child("myimage.jpg");

//  @override
//  void initState(){
//    setState(() {
//      _showChoiceDialog(context);
//    });
//    super.initState();
//
//  }


//  _openCamera(BuildContext context) async {
//    File image;
////    imageCache.clear();
////    removeValues();
//     image = await ImagePicker.pickImage(source: ImageSource.camera);
//
//    this.setState(() {
//      filePath = image;
//      debugPrint("$image");
//      uploadImage();
//    });
//
//    Navigator.of(context).pop();
//  }
//
//  _openGallery(BuildContext context) async {
//    File image;
////    imageCache.clear();
////    removeValues();
//     image = await ImagePicker.pickImage(source: ImageSource.gallery);
//    this.setState(() {
//      filePath = image;
//      debugPrint("$image");
//      uploadImage();
//    });
//    Navigator.of(context).pop();
//  }

  Future getImage(bool isCamera) async{
    File image;
    if (isCamera){
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    }else{
      image= await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _imageFile = image;
      uploadImage();
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make A Choice!"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text("Camera"),
                      onPressed: () {
                       getImage(true);
                      },
                    ),
                  ),
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text("Gallery"),
                        onPressed: () {
                          // debugPrint("$filePath");
                          getImage(false);
                        },
                      ),
                    ),
                    // _imageFile == null ? Container() : Image.file(_imageFile),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: RaisedButton(
                     child: Text("Add Artwork"),
                     onPressed: () {
                              if (_imageFile != null) {
                                removeValues();
                                addStringToSharedPreferences();

                               // if (_uploaded == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserArtScrollView()));
                                } else {
                                  _showAlert();
                              }
                      // getImage(false);
                     },
                   ),
                 )
                 // );
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImageView() {
    if (_imageFile == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(

            child: Text(
              "No Interior Image Selected",
              style: TextStyle(fontSize: 24, color: Colors.blueGrey, fontStyle: FontStyle.italic),
            ),
          )
        ],
        //crossAxisAlignment: CrossAxisAlignment.baseline,

//        child: Text(
//          "No Interior Image Selected",
//          style: TextStyle(fontSize: 24, color: Colors.blueGrey),
//        ),
      );
 //  } else if ((_uploaded == false) && (_imageFile == null)){
   } else if (_uploaded == false){
      return Padding(
        padding: const EdgeInsets.only(bottom:100.0),
        child: CircularProgressIndicator(),
      );
    }
    else{
      debugPrint("$_imageFile");
      return containerBackground(context);
    }
  }

  containerBackground(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portrait();
    } else {
      return landscape();
    }
  }

  portrait() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Image.file(
        _imageFile,
        fit: BoxFit.scaleDown,
      ),
    );
  }

  landscape() {
    return Container(
      height: (MediaQuery.of(context).size.height)*0.80,
      child: Image.file(
      _imageFile,
      fit: BoxFit.scaleDown,
//        cacheHeight: 400,
//        cacheWidth: 550,
    ),
    );
  }

  Future uploadImage () async{
   // StorageReference reference = FirebaseStorage.instance.ref().child("myimage.jpg");
    StorageUploadTask uploadTask = _reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      _uploaded =true;
    });
debugPrint("uploaded");
  }

//  Future downloadImage() async{
//String downloadAddress = await _reference.getDownloadURL();
//setState(() {
//  _downloadURL = downloadAddress;
//  debugPrint("$_downloadURL");
//});
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload an Interior Image"),
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.arrowRight,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: () {
              if (_imageFile != null) {
                removeValues();
                addStringToSharedPreferences();

                // if (_uploaded == true) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UserArtScrollView()));
              } else {
                _showAlert();
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

            _decideImageView(),

          Column(
            children: <Widget>[
              Container(
//                alignment: Alignment.bottomCenter,
//                child: RaisedButton(
//
//                  onPressed: () {
//                    if (_imageFile != null) {
//                      removeValues();
//                      addStringToSharedPreferences();
//
//
//                      // if (_uploaded == true) {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) =>
//                                  UserArtScrollView()));
//                    } else {
//                      _showAlert();
//                    }
//                  },
//                  child: Text("Select Artwork"),
//                ),
              ),
            ],
          ),
        ],


//        child: Center(
//          child: Column(
//            //crossAxisAlignment: CrossAxisAlignment.baseline,
//            mainAxisAlignment: MainAxisAlignment.center, ////////////////////////changed
//            //mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              _decideImageView(),
//              Center(
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  //mainAxisAlignment: MainAxisAlignment.end,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(right: 10),
//                      child: RaisedButton(
//                        onPressed: () {
//                          _showChoiceDialog(context);
//                        },
//                        child: Text("Select Interior Image"),
//                      ),
//                    ),

//                       Container(
//                         alignment: Alignment.bottomCenter,
//                         child: RaisedButton(
//
//                          onPressed: () {
//                            if (_imageFile != null) {
//                              removeValues();
//                              addStringToSharedPreferences();
//
//
//                             // if (_uploaded == true) {
//                                Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) =>
//                                            UserArtScrollView()));
//                              } else {
//                                _showAlert();
//                            }
//                          },
//                          child: Text("Select Artwork"),
//                      ),
//                       ),
//
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo),
        backgroundColor: Colors.blueGrey,
        onPressed: (){
          _showChoiceDialog(context);
        },
      ),
    );
  }

  void _showAlert() {
//    if(filePath == null)
//      return ;
    AlertDialog dialog = new AlertDialog(
      content: new Text(
        "Please Select Interior Image",
        style: new TextStyle(
            color: Colors.blueGrey, fontSize: 30, fontStyle: FontStyle.italic),
      ),
      actions: <Widget>[
        FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
    showDialog(context: context, child: dialog);
  }

//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  prefs.setString('test_image', localImage.path)

  addStringToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("stringValue", _imageFile.path);
    //prefs.setString("stringValue", picture);
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove("stringValue");
  }
}
@override
Future<String> getStringValuesRead(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString('stringValue');
  return stringValue;
}

