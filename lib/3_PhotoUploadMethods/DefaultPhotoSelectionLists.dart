
import 'package:art_display_visuallizer/3_PhotoUploadMethods/DefaultArtworkSelectionList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Paint {
  final String imageVal;
  final String title;
  final String subheading;
  bool selected = false;

  Paint(this.imageVal, this.title, this.subheading);
}

class InteriorScrollView extends StatefulWidget {
  // receive data from the FirstScreen as a parameter

  @override
  _InteriorScrollViewState createState() => _InteriorScrollViewState();
}

class _InteriorScrollViewState extends State<InteriorScrollView> {
//   final String text;

  double padValue = 0;
//  File templateFile;
  bool selectingmode = true;
  String roomLayout;

  List<Paint> paints = <Paint>[
    Paint("images/fireplace.jpg", 'Living Room', "Country Interior"),
    Paint("images/Living Room Yellow.jpg", 'Living Room', "Yellow Interior"),
    Paint("images/Living Room White Couch.png", 'Living Room', "White Interior"),
    Paint("images/Living Room White Leather.jpg", 'Living Room', "White Interior"),
    Paint("images/Living Room All White.jpg", 'Living Room', "White Interior"),
    Paint("images/Living Room White Wall.jpg", 'Living Room', "White Interior"),
    Paint("images/white everything.jpg", 'Living Room', "White Interior"),
    Paint("images/White wall beige couch.jfif", 'Living Room', "White Interior"),
    Paint("images/white walls greay couch.jpg", 'Living Room', "White Interior"),
    Paint("images/Living Room Beige Everything.jpg", 'Living Room', "Beige Interior"),
    Paint("images/Living Room All Beige.jpg", 'Living Room', "Beige Interior"),
    Paint("images/Living Room Beige Leather.png", 'Living Room', "Beige Interior"),
    Paint("images/Living Room Beige.jpg", 'Living Room', "Beige Interior"),
    Paint("images/Living Room Beige Couch.jpg", 'Living Room', "Beige Interior"),
    Paint("images/Living Room Beige Wall.jpg", 'Living Room', "Beige Interior"),
    Paint("images/Living Room Brick Beige Couch.jpg", 'Living Room', "Beige Interior"),
    Paint("images/Living Room Grey Couch.png", 'Living Room', "Grey Interior"),
    Paint("images/Living Room Grey Everything.jpg", 'Living Room', "Grey Interior"),
    Paint("images/Living Room All Grey.jpg", 'Living Room', "Grey Interior"),
    Paint("images/Living Room Conrete Grey Couch.jpg", 'Living Room', "Grey Interior"),
    Paint("images/Living Room Dark Grey.jpg", 'Living Room', "Grey Interior"),
    Paint("images/Living Room Blue Wall.jpg", 'Living Room', "Blue Interior"),
    Paint("images/Living Room Pink.png", 'Living Room', "Pink Interior"),
    Paint("images/Living Room Pink Wall.jpg", 'Living Room', "Pink Interior"),
    Paint("images/Living Room Pink Chair.jpg", 'Living Room', "Pink Interior"),
    Paint("images/black walls yellow couch.jpg", 'Living Room', "Black Interior"),
    Paint("images/Living Room Bamboo.jpg", 'Living Room', "Bamboo Interior"),
    Paint("images/Living Room Beach.jpg", 'Living Room', "Beachy Interior"),
    Paint("images/Living Room Brick Brown Couch.jpg", 'Living Room', "Brick Interior"),
    Paint("images/Living Room Concrete.jpg", 'Living Room', "Concrete Interior"),
    Paint("images/Living Room Fancy.jpg", 'Living Room', "Hotel Interior"),
    Paint("images/Living Room Flowers.jpg", 'Living Room', "Flowery Interior"),
    Paint("images/Living Room Gold.png", 'Living Room', "Gold Interior"),
    Paint("images/Living Room Green Couch.jpg", 'Living Room', "Green Interior"),
    Paint("images/Living Room Greenery.jpg", 'Living Room', "Green Interior"),
    Paint("images/Living Room Hotel.jpg", 'Living Room', "Hotel Interior"),
    Paint("images/Living Room Marble.jpg", 'Living Room', "Marble Interior"),
    Paint("images/Living Room Open.jfif", 'Living Room', "Modern Interior"),
    Paint("images/Living Room Plain.jpg", 'Living Room', "Plain Interior"),
    Paint("images/Living Room Red Couch.jpg", 'Living Room', "Red Interior"),
    Paint("images/Living Room Retro.jpg", 'Living Room', "Retro Interior"),
    Paint("images/Living Room Rustic.jpg", 'Living Room', "Rustic Interior"),
    Paint("images/Living Room Wood.jpg", 'Living Room', "Wooden Interior"),
    Paint("images/Blue Grey Wall.jpg", 'Living Room', "Blue Grey Interior"),
    Paint("images/Yellow Walls Yellow Couch.jpg", 'Living Room', "Yellow Interior"),
    Paint("images/Living Room Brick Wall Yellow Couch.jpeg", 'Living Room', "Yellow Interior")

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: selectingmode
              ?
          IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          )
//          IconButton(
//            icon: const Icon(Icons.arrow_back),
//            onPressed: () {
//              addStringToSharedPreferences();
//              getStringValuesRead();
//              setState(() {
//                selectingmode = false;
//                paints.forEach((p) => p.selected = false);
//              });
//            },
//          )
              : null,
          backgroundColor: Colors.blueGrey,
          title: Text("Select an Interior Template"),
          actions: <Widget>[

          ],
        ),
        body: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(paints.length, (index) {
              return
//              Container(
//           width: 450,
                Container(
                  //  height: 350,
                  //  width: 350,
                  child: InkWell(
                    highlightColor: Colors.lightBlue,
                    onTap: () {
//                  print("${paints[index].imageVal}");
                      paints.forEach((p) => p.selected = false);

                      setState(() {
                        if (selectingmode) {
                          paints[index].selected = !paints[index].selected;
                        }
                      });
                      roomLayout = paints[index].imageVal;
                      removeValues();
                      addStringToSharedPreferences();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => FinalScreen(background: paints[index].imageVal ,)));
                              builder: (context) => ArtScrollView()));
                    },
                    child: new Card(
                      child: Wrap(
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              paints[index].imageVal,
                              //height: 300,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                paints[index].title,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    (selectingmode)
                                        ? ((paints[index].selected)
                                        ? Icon(Icons.check_box)
                                        : Icon(Icons.check_box_outline_blank))
                                        : null
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    paints[index].subheading,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.blueGrey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
            }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            child: Icon(FontAwesomeIcons.arrowRight, color: Colors.white),
            onPressed: () {}),
      ),
    );
  }
  addStringToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("stringValue", roomLayout);
  }


  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove("stringValue");
  }
}

Future<String> getStringValuesRead() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String stringValue = prefs.getString('stringValue');
  return stringValue;
}

