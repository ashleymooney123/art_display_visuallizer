//import 'package:flutter/material.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//        // This makes the visual density adapt to the platform that you run
//        // the app on. For desktop platforms, the controls will be smaller and
//        // closer together (more dense) than on mobile platforms.
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
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
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}


//import 'package:flutter/material.dart';
//import 'package:zoomable_image/zoomable_image.dart';

//void main() {
//  runApp(
//    new MaterialApp(
//      home: new Scaffold(
//        body: new ZoomableImage(
//            new AssetImage('images/purple.jpg'),
//            placeholder: const Center(child: const CircularProgressIndicator()),
//            backgroundColor: Colors.red),
//      ),
//    ),
//  );
//}

//import 'package:flutter/material.dart';
//import 'package:flutter/photo_view.dart';
//import './screens/home_screen.dart';
//
//void main() => runApp(MyApp());
//
//ThemeData theme = ThemeData(
//  primaryColor: Colors.black,
//  backgroundColor: Colors.white10,
//  fontFamily: 'PTSans',
//);
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Photo View Example App',
//      theme: theme,
//      home: Scaffold(
//        body: HomeScreen(),
//      ),
//    );
//  }
//}

import 'package:art_display_visuallizer/1_Credentials/FirstView.dart';
import 'package:art_display_visuallizer/1_Credentials/GoogleSignin.dart';
import 'package:art_display_visuallizer/4_PhotoSelectionViewer/Gestures.dart';
import 'package:art_display_visuallizer/4_PhotoSelectionViewer/WholeScreen.dart';
import 'package:art_display_visuallizer/5_Quote/QuoteForm.dart';
import 'package:art_display_visuallizer/5_Quote/SendEmail.dart';
import 'package:art_display_visuallizer/6_Permissions/Permissions.dart';
import 'package:art_display_visuallizer/6_Permissions/SaveScreenshotPermission.dart';
import 'package:art_display_visuallizer/6_Permissions/imageGallerySaver.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Signin APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
    // home: ArtScrollView(),
      // home: MyEmail(),
      //home:EnterQuoteSelectionsScreen(),
      //home: TransformDemo(),
    // home: GoogleSignApp(),
    home: FirstView(),
    routes: <String, WidgetBuilder>{
        '/signUp': (BuildContext context) => GoogleSignApp(),
      '/home': (BuildContext context) => GoogleSignApp(),
      '/Maybe Later': (BuildContext context) => GoogleSignApp(),
    },
    // home: Test(),
     //home:MyHomePage(),
     // home:Permissions(),
      //home:GoogleProfileScreen(),
      //home: TransformText(),
    );
  }
}
////////////////////////////////////////////////////////////////////////
//class ZoomPage extends StatefulWidget {
//  @override
//  _ZoomPageState createState() => _ZoomPageState();
//}
//
//class _ZoomPageState extends State<ZoomPage> {
//  double _scale = 1.0;
//  double _previousScale = 1.0;
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Zoom Page"),
//      ),
//      body: Center(
//        child: GestureDetector(
//          onScaleStart: (ScaleStartDetails details) {
//            print(details);
//            _previousScale = _scale;
//            setState(() {});
//          },
//          onScaleUpdate: (ScaleUpdateDetails details) {
//            print(details);
//            _scale = _previousScale * details.scale;
//            setState(() {});
//          },
//          onScaleEnd: (ScaleEndDetails details) {
//            print(details);
//
//            _previousScale = 1.0;
//            setState(() {});
//          },
//          child: RotatedBox(
//            quarterTurns: 0,
//            child: RotatedBox(
//              quarterTurns: 1,
//              child: Padding(
//                padding: EdgeInsets.all(8.0),
//                child: Transform(
//                  alignment: FractionalOffset.center,
//                  transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
//                  child: CachedNetworkImage(
//                    imageUrl:
//                    "https://images.unsplash.com/photo-1578253809350-d493c964357f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80",
//                  ),
//                ),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
/////////////////////////////////////////////////////////////////////////////////
//class ZoomPage extends StatefulWidget {
//  @override
//  _ZoomPageState createState() => _ZoomPageState();
//}
//
//class _ZoomPageState extends State<ZoomPage> {
// double _scale = 1.0;
// double _previousScale = 1.0;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Zoom Page"),
//      ),
//      body: Center(
//        child: GestureDetector(
//
//          onScaleStart: (ScaleStartDetails details)
//    {
//      print(details);
//      _previousScale = _scale;
//      setState(() {});
//    },
//              onScaleUpdate: (ScaleUpdateDetails details){
//    print(details);
//    _scale = _previousScale*details.scale;
//    setState(() {});
//    },
//    onScaleEnd: (ScaleEndDetails details){
//            print(details);
//            _previousScale = 1.0;
//            setState(() {
//
//            });
//    },
//
//          child: Padding(
//            padding: const EdgeInsets.all(8.0),
//
//            child: Transform(
//              alignment: FractionalOffset.center,
//              transform: Matrix4.diagonal3(Vector3(_scale,_scale,_scale)),
//              child: CachedNetworkImage(
//imageUrl:
//                "https://images.unsplash.com/photo-1578253809350-d493c964357f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80",
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}

