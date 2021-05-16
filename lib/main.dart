import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siginsignup/admin.dart';
import 'package:siginsignup/pages/admin/Adminnotification.dart';
import 'package:siginsignup/shared/sharedsty.dart';
import 'package:siginsignup/theme.dart';

import 'helper/helperFunctions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Sign());
  }
}

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  String email;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var _scaffoldState = GlobalKey<ScaffoldState>();
  String password;
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: StylingWidgets().decoratedBox(),
        child: Form(
          key: _formkey,
          child: Container(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    height: MediaQuery.of(context).size.height * 1,
                    margin: EdgeInsets.only(top: 100),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        StylingWidgets().authLogo(),
                        StylingWidgets().headline("Happy to have you back"),
                        Center(
                          child: Text(
                            errorMessage.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red[300]),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        StylingWidgets().formTextfield(
                          Center(
                            child: TextFormField(
                              obscureText: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "* Required";
                                } else
                                  return null;
                              },
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.email)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        StylingWidgets().formTextfield(
                          Center(
                            child: TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "* Required";
                                } else
                                  return null;
                              },
                              onChanged: (value) {
                                password = value;
                              },
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.vpn_key)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        InkWell(
                          onTap: () async {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email, password: password);
                            print('has been created');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminNotification()));
                          },
                          child: StylingWidgets().signButton("LOGIN"),
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(height: 20.0),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
