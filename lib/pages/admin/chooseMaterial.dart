import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/admin/arabicgrammer.dart';
import 'package:siginsignup/pages/admin/quran.dart';
import 'package:siginsignup/pages/admin/sarf.dart';
import 'package:siginsignup/pages/admin/sharebottombar.dart';
import 'package:siginsignup/pages/admin/sharedlessonswedges.dart';
import 'package:siginsignup/pages/admin/speaking.dart';
import 'package:siginsignup/pages/admin/writing.dart';
import 'package:siginsignup/shared/appbar.dart';

import '../../theme.dart';

class ChooseMaterial extends StatefulWidget {
  @override
  _ChooseMaterialState createState() => _ChooseMaterialState();
}

class _ChooseMaterialState extends State<ChooseMaterial> {
  int number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getnumber();
  }

  getnumber() async {
    number = await HelperFunctions.getAdminNotifacation();
    setState(() {
      number = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Wid().appbar("Upload Lessons"),
        drawer: null,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LessonWidgets()
                .headline("Choose your catergory to upload materials"),
            Divider(),
            Center(
              child: (Wrap(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuranLessons(),
                          ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Quran', style: stleWhite),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArabicGrammer(),
                          ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Grammer', style: stleWhite),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Sarf(),
                          ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Sarf', style: stleWhite),
                    ),
                  ),
                ],
              )),
            ),
            Divider(),
            Center(
              child: (Wrap(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Writing(),
                          ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Writing', style: stleWhite),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Speaking(),
                          ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: selectedColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Speaking', style: stleWhite),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              )),
            ),
          ],
        ),
        bottomNavigationBar: BottomBarAdmin().bottomBar(
            context,
            Colors.white70,
            Colors.white70,
            selectedColor,
            Colors.white70,
            null,
            null,
            circle(),
            null,
            number));
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }
}
