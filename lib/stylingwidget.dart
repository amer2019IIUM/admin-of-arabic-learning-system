import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';
 
class StylingWidgets {
  String email;
  authLogo() {
    return Center(
      child: Container(
        padding: EdgeInsets.only(right: 75),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(85.0, 0.0, 0.0, 0.0),
              child: Text(
                'ARAB  U',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45.0),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(202.0, 0.0, 0.0, 0.0),
              child: GradientText(
                text: "4",
                colors: [
                  Colors.pink[200],
                  Colors.pink[100],
                ],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0,
                    color: Colors.blue[300]),
              ),
            ),
          ],
        ),
      ),
    );
  }

//////////////////////
  ///
  Widget headlinebig(String text) {
    return Center(
      child: GradientText(
        text: text,
        colors: [Colors.black54, Colors.black54],
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            fontSize: 20.0,
            color: selectedColor),
      ),
    );
  }

  Widget headline(String text) {
    return Center(
      child: GradientText(
        text: text,
        colors: [Color(0xFF4AC8EA), Color(0xFF4AC8EA)],
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            fontSize: 15.0,
            color: selectedColor),
      ),
    );
  }

  Widget formTextfield(child) {
    return Container(
        padding: EdgeInsets.only(left: 15),
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.pink[50],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: child);
  }

  Widget uploadBtn(txt) {
    return Container(
        margin: EdgeInsets.only(right: 20, left: 20),
        alignment: Alignment.center,
        height: 60,
        width: 350,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
              colors: [Colors.pink[50], Colors.pink[50]]),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 12),
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Text(
                txt,
                style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
              ),
            ),
            Container(
                width: 40,
                child: ClipOval(child: Image.asset("assets/upload.png"))),
          ],
        ));
  }

  Widget signButton(txt) {
    return Container(
        alignment: Alignment.center,
        height: 40,
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          gradient: StylingWidgets().gredianColor(),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          txt,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ));
  }

  Widget nextBtn(txt) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 150, left: 150),
      height: 45,
      decoration: BoxDecoration(
        gradient: StylingWidgets().gredianColor(),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Icon(
        Icons.arrow_right_alt_sharp,
        color: Colors.white,
        size: 50,
      ),
    );
  }

  containerWithRadus(
    context,
    Widget wd,
  ) {
    return Container(
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        width: MediaQuery.of(context).size.width * 1,
        padding: EdgeInsets.only(top: 0),
        margin: EdgeInsets.only(top: 70),
        child: wd);
  }

  Widget googleBotton(context, txt) {
    return Container(
        alignment: Alignment.center,
        height: 40,
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
              colors: [Colors.grey[200], Colors.grey[200]]),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                width: 50,
                child: Image.asset("assets/googleicon.png")),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * .749,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Text(
                txt,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
              ),
            ),
          ],
        ));
  }

  Widget clipPath() {
    return ClipPath(
        clipper: WaveClipperOne(),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.pink[200], Color(0xFF4AC8EA)],
            ),
          ),
        ));
  }

  gredianColor() {
    return LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.centerRight,
        colors: [Color(0xFF4AC8EA), Color(0xFF4AC8EA)]);
  }

  Widget cards(context, fun, text, png) {
    return Center(
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 50),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 170,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text.toString().toUpperCase(),
                        style: stle2,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Image.asset(
                          png,
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: 100,
              height: 50,
              child: FlatButton(
                  child: Text(
                    'View',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  onPressed: fun),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [selectedColor, selectedColor]),
          border: Border.all(),
        ),
      ),
    );
  }

  Widget info(text1, text2, context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: 200,
        alignment: Alignment.center,
        child: Card(
          color: Colors.pink[100],
          child: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text1.toString().toUpperCase(),
                    style: GoogleFonts.adventPro(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text(text2.toString().toUpperCase(),
                    style: GoogleFonts.adventPro(
                        fontSize: 30,
                        color: selectedColor,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
      ),
    );
  }

  decoratedBox() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [selectedColor, Colors.pink[200]]));
  }

  stackShapes() {
    return Stack(
      children: [
        ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue[300], Colors.pinkAccent],
                ),
              ),
            )),
      ],
    );
  }

  appbarGrid(context) {
    return PreferredSize(
      child: new Container(
        padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [Colors.red, Colors.yellow]),
            boxShadow: [
              new BoxShadow(
                color: Colors.grey[500],
                blurRadius: 20.0,
                spreadRadius: 1.0,
              )
            ]),
      ),
      preferredSize: new Size(MediaQuery.of(context).size.width, 150.0),
    );
  }
}
