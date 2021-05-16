import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Wid {
  appbar(String text) {
    return AppBar(
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF4AC8EA), Color(0xFF4AC8EA)])),
      ),
      title: Text(
        text.toUpperCase(),
        style: GoogleFonts.ibmPlexSans(
            fontSize: 21.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  homepageappbar(String text, Function fun) {
    return AppBar(
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blue[300], Colors.pinkAccent])),
      ),
      actions: [
        new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {}),
        SizedBox(
          width: 10,
        )
      ],
      title: Text(
        text.toUpperCase(),
        style: GoogleFonts.ibmPlexSans(
            fontSize: 21.0, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  Widget teachSchButtom(String text, fun) {
    Container(
        padding: EdgeInsets.only(left: 10),
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[300], Colors.pinkAccent],
          ),
        ),
        child: FlatButton(
            child: Text(
              'Register'.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            onPressed: () async {}));
  }
}
