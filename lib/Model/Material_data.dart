import 'package:cloud_firestore/cloud_firestore.dart';

class MaterialsData {
  Future quran(
      String title, String videoUrl, String docUrl, String desc) async {
    try {
      await Firestore.instance.collection('quran').document(title).setData({
        'title': title,
        'videoUrl': videoUrl,
        'desc': desc,
        'docUrl': docUrl
      });
      Map<String, String> data = {
        'title': title,
        'videoUrl': videoUrl,
        'desc': desc,
        'docUrl': docUrl
      };
      // doc.setData(data);
    } catch (e) {
      print(e);
    }
  }

  Future sarf(String title, String videoUrl, String docUrl, String desc) async {
    try {
      DocumentReference doc =
          await Firestore.instance.collection('quran').document(title);
      Map<String, String> data = {
        'title': title,
        'videoUrl': videoUrl,
        'desc': desc,
        'docUrl': docUrl
      };
      doc.setData(data);
    } catch (e) {
      print(e);
    }
  }

  Future writing(
      String title, String videoUrl, String docUrl, String desc) async {
    try {
      DocumentReference doc =
          await Firestore.instance.collection('quran').document(title);
      Map<String, String> data = {
        'title': title,
        'videoUrl': videoUrl,
        'desc': desc,
        'docUrl': docUrl
      };
      doc.setData(data);
    } catch (e) {
      print(e);
    }
  }

  Future speaking(
      String title, String videoUrl, String docUrl, String desc) async {
    try {
      DocumentReference doc =
          await Firestore.instance.collection('quran').document(title);
      Map<String, String> data = {
        'title': title,
        'videoUrl': videoUrl,
        'desc': desc,
        'docUrl': docUrl
      };
      doc.setData(data);
    } catch (e) {
      print(e);
    }
  }

  Future grammar(
      String title, String videoUrl, String docUrl, String desc) async {
    try {
      DocumentReference doc =
          await Firestore.instance.collection('quran').document(title);
      Map<String, String> data = {
        'title': title,
        'videoUrl': videoUrl,
        'desc': desc,
        'docUrl': docUrl
      };
      doc.setData(data);
    } catch (e) {
      print(e);
    }
  }
}
