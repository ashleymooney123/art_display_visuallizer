import 'dart:convert';
import 'Artwork_Services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'Description.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_email_sender/flutter_email_sender.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';


class EnterDescriptionSelectionsScreen extends StatefulWidget {
  EnterDescriptionSelectionsScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _EnterDescriptionSelectionsScreenState createState() => new _EnterDescriptionSelectionsScreenState();
}


class _EnterDescriptionSelectionsScreenState extends State<EnterDescriptionSelectionsScreen> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  Description newDescription = new Description();
//  var emailDate;
//  var emailEmail;
//  var emailPhone;
  var emailTitle;
  var emailArtistName;
  var emailSize;
  var emailColor;

  List<String> _mediums = <String>["",'Resin', 'Acrylic Paint', 'Oil Paint', 'Gouache Paint',
    'Watercolour Paint', "Watercolour Pastels", "Watercolour Pencils",
     'Graphite Pencils', 'Coloured Pencils', 'Charcoal', "Oil Pastels",
    "Hard Pastels","Chalk", "Clay", "Ink", "Colour Markers", "Embroidery/Knitting/Crochet", "Wood","Other"];
  String _medium = '';

  List<String> _dimensions = <String>[
    "",
    '11 x 16 inches',
    '16 x 20 inches',
    '18 x 24 inches',
    "22 x 34 inches",
    '30 x 40 inches',
    "36 x 48 inches",
    '48 x 72 inches'
  ];
  String _dimension = '';

//  final TextEditingController _controller = new TextEditingController();

//  Future _chooseDate(BuildContext context, String initialDateString) async {
//    var now = new DateTime.now();
//    var initialDate = convertToDate(initialDateString) ?? now;
//    initialDate =
//    (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);
//
//    var result = await showDatePicker(
//        context: context,
//        initialDate: initialDate,
////        firstDate: new DateTime(1900),
////        lastDate: new DateTime.now());
//        firstDate: new DateTime.now(),
//        lastDate: new DateTime.utc(2025));
//
//    if (result == null) return;
//
//    setState(() {
//      _controller.text = new DateFormat.yMd().format(result);
//    });
//  }
//
//  DateTime convertToDate(String input) {
//    try {
//      var d = new DateFormat.yMd().parseStrict(input);
//      return d;
//    } catch (e) {
//      return null;
//    }
//  }

  List<String> attachments = [];
  bool isHTML = false;

//  final _recipientController = TextEditingController(
//    text: 'ashleymooney03@gmail.com',
//  );
//
//  final _subjectController = TextEditingController(text: 'The subject');
//

//      final _bodyController = TextEditingController(
//  text: emailDate,
//  );

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//  Future<void> send() async {
//    final Email email = Email(
//      // body: _bodyController.text,
//      //((newContact.name) , (newContact.favouriteSize) , (newContact.address)),
//      body: "Customer: $emailArtistName \n\nUser Contact Email: $emailEmail \n\nUser Phone: $emailPhone \n\nUser Address: $emailAddress \n\nRequested Deadline: $emailDate \n\nColor Preference: $emailColor \n\nSize Preference: $emailSize",
//      subject: newDescription.favouriteSize,
//      recipients: [_recipientController.text],
//      attachmentPaths: attachments,
//      isHTML: isHTML,
//    );
//
//    String platformResponse;
//
//    try {
//      await FlutterEmailSender.send(email);
//      platformResponse = 'success';
//    } catch (error) {
//      platformResponse = error.toString();
//    }
//
//
//    if (!mounted) return;
//
//    _scaffoldKey.currentState.showSnackBar(SnackBar(
//      content: Text(platformResponse),
//    ));
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,

      appBar: new AppBar(
        backgroundColor: Colors.blueGrey,
        //     title: new Text(widget.title),
        title: new Text("Enter A New Artwork"),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    decoration: const InputDecoration(

                      icon: const Icon(Icons.person),
                      hintText: 'Enter your first and last name',
                      labelText: 'Artist Name',
                      //   border: OutlineInputBorder(),
                    ),
                    inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                    validator: (val) => val.isEmpty ? 'Name is required' : null,
                    //onSaved: (val) => newContact.name = val,
                    onSaved:(val){
                      newDescription.artistName = val;
                      emailArtistName =val;
                    },
                  ),

//                  new Row(children: <Widget>[
//                    new Expanded(
//                        child:
//                        new TextFormField(
//                            decoration: new InputDecoration(
//                              icon: const Icon(Icons.calendar_today),
//                              hintText: 'Enter a Deadline',
//                              labelText: 'Deadline',
//                            ),
//                            controller: _controller,
//                            keyboardType: TextInputType.datetime,
//                            validator: (val) => isValidDob(val) ? null : 'Not a valid date',
//                            onSaved: (val) {
//                              newDescription.dob = convertToDate(val);
//                              emailDate =convertToDate(val);
//
//                            }
//                        )),
//                    new IconButton(
//                      icon: new Icon(Icons.more_horiz),
//                      tooltip: 'Choose date',
//                      onPressed: (() {
//                        _chooseDate(context, _controller.text);
//                      }),
//                    )
//                  ]),
//                  new TextFormField(
//                      decoration: const InputDecoration(
//                        icon: const Icon(Icons.phone),
//                        hintText: 'Enter a phone number',
//                        labelText: 'Phone',
//                      ),
//                      keyboardType: TextInputType.phone,
//                      inputFormatters: [
//                        new WhitelistingTextInputFormatter(
//                            new RegExp(r'^[()\d -]{1,15}$')),
//                      ],
//                      validator: (value) =>
//                      isValidPhoneNumber(value)
//                          ? null
//                          : 'Phone number must be entered as (###)###-####',
//                      onSaved: (val) {
//                        newDescription.phone = val;
//                        emailPhone= val;
//
//                      }
//
//                  ),
//                  new TextFormField(
//                    decoration: const InputDecoration(
//                      icon: const Icon(Icons.email),
//                      hintText: 'Enter a email address',
//                      labelText: 'Email',
//                    ),
//                    keyboardType: TextInputType.emailAddress,
//                    validator: (value) =>
//                    isValidEmail(value)
//                        ? null
//                        : 'Please enter a valid email address',
//                    onSaved:(val){
//                      newContact.email = val;
//                      emailEmail =val;
//                    },
//                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.title),
                      hintText: 'Enter your shipping address',
                      labelText: 'Title of Artwork',
                    ),
                    // inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                    validator: (val) =>
                    val.isEmpty
                        ? 'Title is required'
                        : null,
                    inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                   // validator: (val) => val.isEmpty ? 'Name is required' : null,
                    onSaved:(val){
                      newDescription.title = val;
                      emailTitle =val;
                    },
                  ),
                  new FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.format_paint),
                          labelText: 'Medium Used',
                          errorText: state.hasError ? state.errorText : null,
                        ),
                        isEmpty: _medium == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _medium,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                newDescription.mediumUsed = newValue;
                                emailColor = newValue;
                                _medium = newValue;
                                state.didChange(newValue);
                              });

                            },

                            items: _mediums.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                    validator: (val) {
                      return val != '' ? null : 'Please select medium used';
                    },
                  ),
                  new FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.photo_size_select_large),
                          labelText: 'Dimensions of Artwork',
                          errorText: state.hasError ? state.errorText : null,
                        ),
                        isEmpty: _dimension == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _dimension,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                newDescription.dimensionSize = newValue;
                                emailSize = newValue;
                                _dimension = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _dimensions.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                    validator: (val) {
                      return val != '' ? null : 'Please select a size';
                    },
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.description),
                      hintText: 'Enter a brief description',
                      labelText: 'Description of Artwork',
                    ),
                    // inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                    validator: (val) =>
                    val.isEmpty
                        ? 'Description is required'
                        : null,
                    inputFormatters: [new LengthLimitingTextInputFormatter(500)],
                    // validator: (val) => val.isEmpty ? 'Name is required' : null,
                    onSaved:(val){
                      newDescription.description = val;
                      emailTitle =val;
                    },
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: new RaisedButton(
                            child: const Text('Submit'),
                            onPressed:(){
                             // final uid = await Provider.of(context).auth.getCurrentUID();
                              _submitForm();
                              //send();

                            }
                        ),
                      )),
                ],

              )
          )),
    );
  }


  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event

      print('Form save called, newContact is now up to date...');
      print('Artist Name: ${newDescription.artistName}');
     // print('Deadline: ${newDescription.dob.year}/${newDescription.dob.month}/${newDescription.dob.day}');
//      print('Phone: ${newDescription.phone}');
//      print('Email: ${newDescription.email}');
      print('Title of Art: ${newDescription.title}');
      print('Color Choice: ${newDescription.mediumUsed}');
      print('Artwork Size: ${newDescription.dimensionSize}');
      print('========================================');
      print('Submitting to back end...');

      var descriptionService = new DescriptionService();
      descriptionService.createDescription(newDescription)
          .then((value) =>
       showMessage('New description created for ${value.artistName}!'));
      //showMessage('New contact created for name'));
      Timer(Duration(seconds: 3), () {
        form.reset();
        _dimension = null;
        _medium = null;
        debugPrint("Form reset after 3 seconds");
     });

    }
  }



  void showMessage(String message, [MaterialColor color = Colors.red]) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<
        ScaffoldState>();
    _scaffoldKey.currentState
        .showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\(\d\d\d\)\d\d\d-\d\d\d\d$');
    return regex.hasMatch(input);
  }

//  bool isValidDob(String dob) {
//    if (dob.isEmpty) return true;
//    var d = convertToDate(dob);
//    // return d != null && (d.isAfter(new DateTime.now());
//    return d != null;
//  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }
}
//limit name length
//inputFormatters
