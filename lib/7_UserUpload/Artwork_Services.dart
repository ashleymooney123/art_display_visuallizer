import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'Description.dart';

class DescriptionService {
  // static const _serviceUrl = 'http://mockbin.org/echo';
  // static const _serviceUrl = 'https://ashleys-art-gallery.firebaseio.com/Requests.json';
  static const _serviceUrl = 'https://new-art-display.firebaseio.com/users/LcN6G3kyWMDN7v1zsnTy/Artwork.json';
  static final _headers = {'Content-Type': 'application/json'};

  Future<Description> createDescription(Description description) async {
    try {
      String json = _toJson(description);
      final response =
      await http.post(_serviceUrl, headers: _headers, body: json);
      var c = _fromJson(response.body);
      return c;
    } catch (e) {
      print('Server Exception!!!');
      print(e);
      return null;
    }
  }

  Description _fromJson(String jsonDescription) {
    Map<String, dynamic> map = json.decode(jsonDescription);
    var description = new Description();
    description.artistName = map['artistName'];
    //description.dob = new DateFormat.yMd().parseStrict(map['dob']);
//    description.phone = map['phone'];
//    description.email = map['email'];
    description.title = map ['title'];
    description.mediumUsed = map['mediumUsed'];
    description.dimensionSize = map['favouriteSize'];
    description.description = map['description'];
    return description;
  }

  String _toJson(Description description) {
    var mapData = new Map();
    mapData["artistName"] = description.artistName;
   // mapData["dob"] = new DateFormat.yMd().format(description.dob);
//    mapData["phone"] = description.phone;
//    mapData["email"] = description.email;
    mapData["title"] = description.title;
    mapData["mediumUsed"] = description.mediumUsed;
    mapData["favouriteSize"] = description.dimensionSize;
    mapData["description"] = description.description;
    String jsonDescription = json.encode(mapData);
    return jsonDescription;
  }
}