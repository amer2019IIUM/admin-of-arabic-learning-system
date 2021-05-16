import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siginsignup/Model/Material_data.dart';
import 'package:siginsignup/custom_navigation_drawer.dart';
import 'package:siginsignup/pages/admin/sharedlessonswedges.dart';
import 'package:siginsignup/shared/appbar.dart';

import 'chooseMaterial.dart';

class QuranLessons extends StatefulWidget {
  @override
  _QuranLessonsState createState() => _QuranLessonsState();
}

class _QuranLessonsState extends State<QuranLessons> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _videoUrl;
  String _docUrl;
  String loadingmaterial;
  String doc;
  String _title;
  String desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Wid().appbar("quran tajweed"),
      body: ListView(
        children: [
          LessonWidgets().headline("Uploading Materials"),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 15,
          ),
          LessonWidgets().formWithFormField(_globalKey, context,"quran"),
        ],
      ),
    );
  }
}
