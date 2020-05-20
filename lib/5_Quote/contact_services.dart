import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'contact.dart';

class ContactService {
 // static const _serviceUrl = 'http://mockbin.org/echo';
 // static const _serviceUrl = 'https://ashleys-art-gallery.firebaseio.com/Requests.json';
  static const _serviceUrl = 'https://new-art-display.firebaseio.com/Requests.json';

  static final _headers = {'Content-Type': 'application/json'};

  Future<Contact> createContact(Contact contact) async {
    try {
      String json = _toJson(contact);
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

  Contact _fromJson(String jsonContact) {
    Map<String, dynamic> map = json.decode(jsonContact);
    var contact = new Contact();
    contact.name = map['name'];
    contact.dob = new DateFormat.yMd().parseStrict(map['dob']);
    contact.phone = map['phone'];
    contact.email = map['email'];
    contact.address = map ['address'];
    contact.favoriteColor = map['favoriteColor'];
    contact.favouriteSize = map['favouriteSize'];

    return contact;
  }

  String _toJson(Contact contact) {
    var mapData = new Map();
    mapData["name"] = contact.name;
    mapData["dob"] = new DateFormat.yMd().format(contact.dob);
    mapData["phone"] = contact.phone;
    mapData["email"] = contact.email;
    mapData["address"] = contact.address;
    mapData["favoriteColor"] = contact.favoriteColor;
    mapData["favouriteSize"] = contact.favouriteSize;
    String jsonContact = json.encode(mapData);
    return jsonContact;
  }
}