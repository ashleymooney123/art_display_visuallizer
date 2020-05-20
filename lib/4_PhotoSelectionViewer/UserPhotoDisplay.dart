import 'package:art_display_visuallizer/3_PhotoUploadMethods/DefaultPhotoSelectionLists.dart';
import 'package:art_display_visuallizer/5_Quote/QuoteForm.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';


class UserPhotoDisplayScreen extends StatefulWidget {
  final String geode;
  final String title;

  UserPhotoDisplayScreen({Key key, this.geode, this.title}) : super(key: key);

  @override
  _UserPhotoDisplayScreenState createState() => _UserPhotoDisplayScreenState();
}

const double min = pi * -2;
const double max = pi * 2;
const double minScale = 0.01;
const double defScale = 0.2;
const double maxScale = 0.5;

class _UserPhotoDisplayScreenState extends State<UserPhotoDisplayScreen> {

  String _downloadURL;
  StorageReference _reference = FirebaseStorage.instance.ref().child("myimage.jpg");
 // String _background ;

  double scale = 0.0;
  static GlobalKey previewContainer = new GlobalKey();
 // int _counter = 0;

//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }


  PhotoViewControllerBase controller;
  PhotoViewScaleStateController scaleStateController;

  int calls = 0;
  bool pressed = false;

// double size = defScale;
  // double finalScale = sizeFinal;

  @override
  void initState() {
   // getStringValuesRead();
    controller = PhotoViewController()
      ..scale = defScale
      ..outputStateStream.listen(onController);

    scaleStateController = PhotoViewScaleStateController()
      ..outputScaleStateStream.listen(onScaleState);

    scaleStateController.scaleState = PhotoViewScaleState.initial;
   // imageCache.clear();
    downloadImage();

    super.initState();

//    getStringValuesRead().then((value) {
//      print("value: $value");
//      _background = value;
//      setState(() {});
//    });

  }

  void onController(PhotoViewControllerValue value) {
    setState(() {
      calls += 1;
    });
  }

  void onScaleState(PhotoViewScaleState scaleState) {
    print(scaleState);
  }

  void goBack() {
    scaleStateController = PhotoViewScaleStateController()
      ..outputScaleStateStream.listen(onScaleState);

    scaleStateController.scaleState = PhotoViewScaleState.initial;
  }

  @override
  void dispose() {
    controller.dispose();
    scaleStateController.dispose();
    super.dispose();
  }

//  void goBack() {
//    scaleStateController.scaleState = PhotoViewScaleState.originalSize;
//  }

Future  downloadImage() async{
    String downloadAddress = await _reference.getDownloadURL();
    setState(() {
      _downloadURL = downloadAddress;
      debugPrint("$_downloadURL");
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    //  var realHeight = MediaQuery.of(context).size.height;
    if (_downloadURL == null){
    //  return CircularProgressIndicator();
      return Container();
    }
    else {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("Edit Image"),
            backgroundColor: Colors.blueGrey,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.mode_edit,
                  color: Colors.white,
                ),
                onPressed: () async {
//                getStringValuesRead();
                  setState(() {
                    if (pressed == false) {
                      pressed = true;
                    } else if (pressed == true) {
                      pressed = false;
                    }
                  });

                  setState(() {
                    //               initState();
                    goBack();
                  });

                  debugPrint("Original: ${PhotoViewScaleState.originalSize}");

                  // getStringValuesRead();

                  //  PhotoViewControllerValue();

//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) =>
//                     //       new FinalScreen(geode: geodesList[index].image)));
//                        FinalScaleScreen()));
                },
              )
            ],
          ),

          body: RepaintBoundary(
            key: previewContainer,
            child:
//          new FutureBuilder(
//              //future: getStringValuesRead(),
//            future: downloadImage(),
//              initialData: "Waiting...",
//              builder: (BuildContext context, AsyncSnapshot snapshot){
//                print('snapshot: $snapshot');
            //////////////////////////////
            //return
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    // image: AssetImage(snapshot.data),
                      image: NetworkImage(
                          _downloadURL
                      ),
                      fit: BoxFit.cover)
              ),

              child: MatrixGestureDetector(
                onMatrixUpdate: (m, tm, sm, rm) {
                  notifier.value = m;
                },
                child: AnimatedBuilder(
                  animation: notifier,
                  builder: (ctx, child) {
                    return Transform(
                      transform: notifier.value,
                      child: Center(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(top: 50),
                              child: Transform.scale(
                                scale: 1,
                                // make this dynamic to change the scaling as in the basic demo
                                origin: Offset(0.0, 0.0),
                                child: Container(
                                  height: 100,
                                  child:
                                  //  imageAssetGeode()
                                  Image.asset(widget.geode),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////
            // }),
          ),

//        floatingActionButton: FloatingActionButton(
//            backgroundColor: Colors.blueGrey,
//            child: Icon(FontAwesomeIcons.plus, color: Colors.white),
//            onPressed: () {
//            screenShot();
//
//
////              Navigator.push(
////                  context,
////                  new MaterialPageRoute(
////                    builder: (context) => ArtScrollView(),
////                  ));
//            }
//
//            ),

          floatingActionButton: new FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () {
//            debugPrint('$_counter');
//            _incrementCounter();
//            setState(() {
//              if (pressed == false) {
//
//              } else if (pressed == true) {
//                pressed = false;
//              }
//            });
//            setState(() {
//              //               initState();
//              goBack();
//            });
              Timer(Duration(seconds: 1), () {
                _saveScreen();
                debugPrint("Yeah, this line is printed after 1 seconds");
              });
              _showAlert();
            },
            //screenShot,
            tooltip: 'Increment',
            child: new Icon(FontAwesomeIcons.save, color: Colors.white),
          ),

        ),
      );
    }
  }

  void _showAlert() {
//    if(filePath == null)
//      return ;
    AlertDialog dialog = new AlertDialog(
      content: new Text(
        "Image Saved! \nWould You Like a Quote?",
        textAlign: TextAlign.center,
        style: new TextStyle(
            color: Colors.blueGrey, fontSize: 30, fontStyle: FontStyle.italic),
      ),
      actions: <Widget>[
        FlatButton(
            child: Text("Yes"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EnterQuoteSelectionsScreen()));
            }),
        FlatButton(
            child: Text("No"),
            onPressed: () {
              Navigator.pop(context);
//            onPressed: (){
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => SendEmail()));
            }),
      ],
    );
    showDialog(context: context, child: dialog);
  }

  _saveScreen() async {
    RenderRepaintBoundary boundary = previewContainer.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final result = await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
    print(result);
  }

//  takeScreenShot() async{
//    RenderRepaintBoundary boundary = previewContainer.currentContext.findRenderObject();
//    ui.Image image = await boundary.toImage();
//    final directory = (await getApplicationDocumentsDirectory()).path;
//    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//    Uint8List pngBytes = byteData.buffer.asUint8List();
//    print(pngBytes);
//    File imgFile =new File('$directory/screenshot.png');
//    imgFile.writeAsBytes(pngBytes);
//  }
//
//  screenShot() async{
//    RenderRepaintBoundary boundary = previewContainer.currentContext.findRenderObject();
//    ui.Image image = await boundary.toImage();
//    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//    var filePath = await ImagePickerSaver.saveFile(fileData:byteData.buffer.asUint8List() );
//    debugPrint(filePath);
//
//  }

  containerNewGeode(BuildContext context) {
    if (MediaQuery
        .of(context)
        .orientation == Orientation.portrait) {
      return portraitGeode();
    } else {
      return landscapeGeode();
    }
  }

  containerOnlyBackground(BuildContext context) {
    if (MediaQuery
        .of(context)
        .orientation == Orientation.portrait) {
      return landscapeAndPortraitBackground();
    } else {
      return landscapeAndPortraitBackground();
    }
  }

  geodeOrientation(BuildContext context) {
    if (MediaQuery
        .of(context)
        .orientation == Orientation.portrait) {
      return EdgeInsets.only(
        //right: 10, left: 10, bottom: 10, top: 10),
          right: 110,
          left: 110,
          bottom: 270,
          top: 170);
    } else {
      return EdgeInsets.only(right: 60, left: 60, bottom: 130, top: 30);
    }
  }

  portraitGeode() {
    return Container(
      margin: EdgeInsets.only(
        //right: 10, left: 10, bottom: 10, top: 10),
          right: 110,
          left: 110,
          bottom: 270,
          top: 170),
      //     child: Image.asset(((geode) == null) ? "images/teal geode.jpg" : geode),
      child: imageAssetGeode(),
    );
  }

  landscapeGeode() {
    return Container(
      margin: EdgeInsets.only(right: 50, left: 50, bottom: 110, top: 30),
      //  child: imageAsset(context),
      child: imageAssetGeode(),
    );
  }

  landscapeAndPortraitBackground() {
    return Container(
      // child: imageAssetBackground(),
    );
  }

  imageAssetGeode() {
    if ((widget.geode) == null) {
      return Image.asset("images/geode teal.jpg");
    } else if ((widget.geode) != null) {
      return Image.asset(widget.geode);
    }
  }
} //added
//
//  container() {
//    return Container(
//      padding: const EdgeInsets.all(20.0),
//      child: StreamBuilder(
//        stream: controller.outputStateStream,
//        initialData: controller.value,
//        builder: _streamBuild,
//      ),
//    );
//  }
//
//  Widget _streamBuild(BuildContext context, AsyncSnapshot snapshot) {
//    if (snapshot.hasError || !snapshot.hasData || (pressed == false)) {
//      return Container(
//
//          // child: Image.asset("images/geode teal.jpg"),
//          );
//    }
//
//    PhotoViewControllerValue value = snapshot.data;
//
//    return Column(
//      children: <Widget>[
//        Text(
//          "Rotation ${value.rotation}",
//          style: const TextStyle(color: Colors.white),
//        ),
//        SliderTheme(
//          data: SliderTheme.of(context).copyWith(
//              activeTrackColor: Colors.blueGrey, thumbColor: Colors.blueGrey),
//          child: Slider(
//            value: value.rotation.clamp(min, max),
//            min: min,
//            max: max,
//            onChanged: (double newRotation) {
//              controller.rotation = newRotation;
//            },
//          ),
//        ),
//        Text(
//          "Scale ${value.scale}",
//          style: const TextStyle(color: Colors.white),
//        ),
//        SliderTheme(
//          data: SliderTheme.of(context).copyWith(
//            activeTrackColor: Colors.blueGrey,
//            thumbColor: Colors.blueGrey,
//          ),
//          child: Slider(
//            value: value.scale.clamp(minScale, maxScale),
//            min: minScale,
//            max: maxScale,
//            onChanged: (double newScale) {
//              controller.scale = newScale;
//              // scaleStateController.scaleState = PhotoViewScaleState.covering;
//            },
//          ),
//        ),
//        Text(
//          "Position ${value.position.dx}",
//          style: const TextStyle(color: Colors.white),
//        ),
//        SliderTheme(
//          data: SliderTheme.of(context).copyWith(
//            activeTrackColor: Colors.blueGrey,
//            thumbColor: Colors.blueGrey,
//          ),
//          child: Slider(
//            value: value.position.dx.clamp(-1000, 1000),
//            min: -1000.0,
//            max: 1000.0,
//            onChanged: (double newPosition) {
//              controller.position = Offset(newPosition, controller.position.dy);
//            },
//          ),
//        ),
//        Text(
//          "ScaleState ${scaleStateController.scaleState}",
//          style: const TextStyle(color: Colors.white),
//        ),
//      ],
//    );
//  }
//}
