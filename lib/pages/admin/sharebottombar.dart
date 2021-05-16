import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/widgets/widget.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/admin/Adminnotification.dart';

import 'package:siginsignup/pages/admin/chooseMaterial.dart';

 
import '../../admin.dart';

class BottomBarAdmin {
  fun1(context) async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Admin(),
        ));
    await HelperFunctions.getAdminNotifacation();
  }

  fun2(
    context,
  ) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StudentControl(),
        ));
  }

  fun3(context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ChooseMaterial(),
        ));
  }

  fun4(
    context,
  ) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AdminNotification(),
        ));
  }

  dynamic bottomBar(context, color1, color2, color3, color4, circle1, circle2,
      circle3, circle4, number) {
    Color color = Colors.blue[300];

    return BottomAppBar(
      color: Color(0xFF272D34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () {
              fun1(context);
            },
            child: Container(
              decoration: circle1,
              child: Container(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 70,
                    minHeight: 70,
                    maxWidth: 70,
                    maxHeight: 70,
                  ),
                  child: Image.asset(
                    'assets/teacher.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              fun2(context);
            },
            child: Container(
              decoration: circle2,
              child: Container(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 70,
                    minHeight: 70,
                    maxWidth: 70,
                    maxHeight: 70,
                  ),
                  child: Image.asset(
                    'assets/student.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: circle3,
            child: IconButton(
              tooltip: "Uploading Material",
              highlightColor: Colors.white,
              splashColor: Colors.white,
              onPressed: () {
                fun3(context);
              },
              icon: Icon(
                Icons.school,
                size: 35,
                color: color3,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                decoration: circle4,
                child: IconButton(
                  tooltip: "Notification",
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: () {
                    fun4(context);
                  },
                  icon: Icon(
                    Icons.notifications,
                    size: 35,
                    color: color4,
                  ),
                ),
              ),
              Positioned(
                left: 21,
                top: 17,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                  ),
                  child: number == 0
                      ? Container()
                      : Text(
                          number.toString(),
                          style: GoogleFonts.aBeeZee(color: Colors.white),
                        ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  ///////////////////////////////////
  //

   
}
