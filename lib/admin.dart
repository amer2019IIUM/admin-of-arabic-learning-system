import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:siginsignup/const/bottombar.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';

import 'package:siginsignup/pages/admin/chooseMaterial.dart';
import 'package:siginsignup/pages/admin/deleteStd.dart';
import 'package:siginsignup/pages/admin/deleteteacher.dart';
import 'package:siginsignup/pages/admin/sharebottombar.dart';

import 'package:siginsignup/shared/appbar.dart';

import 'helper/helperFunctions.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int index;
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
        appBar: Wid().appbar("Control tutors"),
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('teachers').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot documentSnapshot) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeleteTeacher(
                                  documentSnapshot.data["email"])));
                    },
                    child: Dismissible(
                      key: ObjectKey(documentSnapshot.data),
                      onDismissed: (direction) {
                        documentSnapshot.reference.delete();
                        print(documentSnapshot.data);
                      },
                      direction: DismissDirection.startToEnd,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(style: BorderStyle.solid),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [selectedColor, Colors.pink[200]]),
                              borderRadius: BorderRadius.circular(10)),
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              height: 95,
                              child: ListTile(
                                trailing: RaisedButton(
                                  color: Colors.pink[400],
                                  child: Text(
                                    'Delete'.toUpperCase(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    documentSnapshot.reference.delete();
                                    print(documentSnapshot.data);
                                  },
                                ),
                                leading: CircleAvatar(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: 44,
                                      minHeight: 44,
                                      maxWidth: 44,
                                      maxHeight: 44,
                                    ),
                                    child: Image.network(
                                      documentSnapshot.data['photo'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  documentSnapshot.data['fname'] +
                                      ' ' +
                                      documentSnapshot.data['lname'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList());
              }
            },
          ),
        ),
        bottomNavigationBar: BottomBarAdmin().bottomBar(
            context,
            selectedColor,
            Colors.white70,
            Colors.white70,
            Colors.white70,
            circle(),
            null,
            null,
            null,
            number));
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }
}

class StudentControl extends StatefulWidget {
  @override
  _StudentControlState createState() => _StudentControlState();
}

class _StudentControlState extends State<StudentControl> {
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
        appBar: Wid().appbar("Control tutors"),
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('students').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return new ListView(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot documentSnapshot) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeleteStd(
                                    documentSnapshot.data["uid"].toString())));
                      },
                      child: Dismissible(
                        key: ObjectKey(documentSnapshot.data),
                        onDismissed: (direction) {
                          documentSnapshot.reference.delete();
                          print(documentSnapshot.data);
                        },
                        direction: DismissDirection.startToEnd,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(style: BorderStyle.solid),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [selectedColor, Colors.pink[200]]),
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                        Border.all(style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                height: 95,
                                child: ListTile(
                                  trailing: RaisedButton(
                                    color: Colors.pink[400],
                                    child: Text(
                                      'Delete'.toUpperCase(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      documentSnapshot.reference.delete();
                                      print(documentSnapshot.data);
                                    },
                                  ),
                                  leading: CircleAvatar(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minWidth: 44,
                                        minHeight: 44,
                                        maxWidth: 44,
                                        maxHeight: 44,
                                      ),
                                      child: Image.network(
                                        documentSnapshot.data['photo'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    documentSnapshot.data['fname'] +
                                        ' ' +
                                        documentSnapshot.data['lname'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ));
                }).toList());
              }
            },
          ),
        ),
        bottomNavigationBar: BottomBarAdmin().bottomBar(
            context,
            Colors.white70,
            selectedColor,
            Colors.white70,
            Colors.white70,
            null,
            circle(),
            null,
            null,
            number));
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }
}
