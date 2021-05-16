import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 
import 'package:siginsignup/shared/shareddialog.dart';

class DeleteTeacher extends StatefulWidget {
  String teacherEmail;
  DeleteTeacher(this.teacherEmail);
  @override
  _DeleteTeacherState createState() => _DeleteTeacherState();
}

class _DeleteTeacherState extends State<DeleteTeacher> {
  TextStyle stle = GoogleFonts.openSans(
      fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("teachers")
            .document(widget.teacherEmail)
            .snapshots(),
        builder: (context, snapshot) {
          return Card(
            child: Container(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Ink(
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                              gradient: LinearGradient(colors: [
                                Color(0xFF4AC8EA),
                                Color(0xFF4AC8EA),
                              ]),
                            ),
                          ),
                          Ink(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 140),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  color: Colors.white,
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xFF4AC8EA),
                                            Color(0xFF4AC8EA),
                                            Colors.pink[200],
                                          ]),
                                    ),
                                    child: Center(
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                              snapshot.data["photo"],
                                              width: 300,
                                              height: 300,
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Color(0xFF4AC8EA),
                        ),
                        title: Text("Name", style: stle),
                        subtitle: Text(
                            snapshot.data["fname"].toString().toUpperCase() +
                                " " +
                                snapshot.data["lname"].toString().toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontStyle: FontStyle.italic)),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.email, color: Color(0xFF4AC8EA)),
                        title: Text(
                          "E-Mail",
                          style: stle,
                        ),
                        subtitle: Text(snapshot.data["email"].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontStyle: FontStyle.italic)),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.padding, color: Color(0xFF4AC8EA)),
                        title: Text(
                          "Gender",
                          style: stle,
                        ),
                        subtitle: Text(snapshot.data["gender"],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontStyle: FontStyle.italic)),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.location_city_outlined,
                            color: Color(0xFF4AC8EA)),
                        title: Text("Address", style: stle),
                        subtitle: Text(snapshot.data["address"],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontStyle: FontStyle.italic)),
                      ),
                      Divider(),
                      ListTile(
                        leading:
                            Icon(Icons.description, color: Color(0xFF4AC8EA)),
                        title: Text(
                          "Description",
                          style: stle,
                        ),
                        subtitle: Text(snapshot.data["desc"].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontStyle: FontStyle.italic)),
                      ),
                      Divider(),

                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          child: Container(
                              width: 300,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xFF4AC8EA),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: FlatButton(
                                child: Text(
                                  'Delete'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0),
                                ),
                                onPressed: () async {
                                  await Firestore.instance
                                      .collection("teachers")
                                      .document(widget.teacherEmail)
                                      .delete();

                                  Navigator.pop(context);
                                  SharedShowDialog().showdialogSuccessful1(
                                      context, "Teacher has been delete.");
                                },
                              )),
                        ),
                      ),
                      // if ((widget.studentTeachID == isRequest))
                      // requestButton()
                      //  Center(
                      //     child: FlatButton(
                      //       color: Colors.blue[300],
                      //       child: Text(
                      //         'Request a tutor',
                      //         style: TextStyle(
                      //             color: Colors.white, fontSize: 17.0),
                      //       ),
                      //       onPressed: () {
                      //         print('is ' + widget.studentTeachID);
                      //         Service()
                      //             .requestTutor(
                      //                 widget.datastudnets.last + passId[14],
                      //                 passId[14].toString(),
                      //                 widget.datastudnets.last.toString(),
                      //                 passId[1] + " " + passId[9],
                      //                 passId[4])
                      //             .then((value) =>
                      //                 print('create request ${passId[14]}'));
                      //         print(passId[1] + " " + passId[7]);
                      //       },
                      //     ),
                      //   )
                      // else
                      //   Center(
                      //     child: FlatButton(
                      //       color: Colors.green[300],
                      //       child: Text(
                      //         'pending',
                      //         style:
                      //             TextStyle(color: Colors.white, fontSize: 17.0),
                      //       ),
                      //       onPressed: () {},
                      //     ),
                      //   ),

                      Divider()
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }
}
