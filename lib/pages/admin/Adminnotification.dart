import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';
import 'package:siginsignup/helper/helperFunctions.dart';
import 'package:siginsignup/pages/admin/sharebottombar.dart';
import 'package:siginsignup/shared/appbar.dart';
import 'package:siginsignup/shared/shareddialog.dart';

class AdminNotification extends StatefulWidget {
  @override
  _AdminNotificationState createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification> {
  int n;
  int number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getnumber();
  }

  getnumber() async {
    number = await HelperFunctions.getAdminNotifacation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Wid().appbar("Notifcation"),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection("teachers")
              .where("icno", isEqualTo: "pending")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              n = snapshot.data.documents.length;
              HelperFunctions.saveAdminNotifacation(n);

              return new ListView(
                  children: snapshot.data.documents
                      .map((DocumentSnapshot documentSnapshot) {
                documentSnapshot.data.length;
                return Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      height: 320,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                selectedColor,
                                Colors.pink[200],
                              ])),
                      child: Column(
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                documentSnapshot.data['photo'],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text("NAME", style: stleWhite),
                            subtitle: Text(
                                documentSnapshot.data['fname']
                                        .toString()
                                        .toUpperCase() +
                                    " " +
                                    documentSnapshot.data['lname']
                                        .toString()
                                        .toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic)),
                          ),
                          ListTile(
                            trailing: InkWell(
                              onTap: () async {
                                final request =
                                    await Permission.storage.request();
                                if (request.isGranted) {
                                  final storagePath =
                                      await getExternalStorageDirectory();
                                  await FlutterDownloader.enqueue(
                                      url: documentSnapshot.data["cv"],
                                      savedDir: storagePath.path,
                                      fileName:
                                          '${documentSnapshot.data["fname"]} cv');
                                } else {
                                  print('Not permssion');
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: selectedColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.file_download),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      "TUTOR CV",
                                      style: stleButton,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            title: Text("EMAIL", style: stleWhite),
                            subtitle: Text(
                                documentSnapshot.data['email']
                                    .toString()
                                    .toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.italic)),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 80.0,
                      left: 80,
                      top: 290.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              await Firestore.instance
                                  .collection("teachers")
                                  .document(
                                      documentSnapshot.data['email'].toString())
                                  .updateData({"icno": "approved"});
                              SharedShowDialog().showdialogSuccessful1(context,
                                  "This tutor has been approved successfully.");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.green[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Approve",
                                style: stleButton,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              await Firestore.instance
                                  .collection("teachers")
                                  .document(
                                      documentSnapshot.data['email'].toString())
                                  .updateData({"icno": "rejected"});
                              SharedShowDialog().showdialogSuccessful1(context,
                                  "This tutor has been rejected successfully.");
                              print(number);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Reject",
                                style: stleButton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }).toList());
            }
          }),
      bottomNavigationBar: BottomBarAdmin().bottomBar(
          context,
          Colors.white70,
          Colors.white70,
          Colors.white70,
          selectedColor,
          null,
          null,
          null,
          circle(),
          number),
    );
  }

  dynamic circle() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.blueAccent.withOpacity(.2));
  }
}
