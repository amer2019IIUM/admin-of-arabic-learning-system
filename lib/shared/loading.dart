import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SpinKitCubeGrid(
              color: selectedColor,
              // duration: Duration(seconds: 5),
            ),
          )),
    );
  }
}
