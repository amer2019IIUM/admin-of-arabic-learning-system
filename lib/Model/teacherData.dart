import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherData {
  Future teacherData(
      String uid,
      String fname,
      String lname,
      String email,
      String password,
      String country,
      String icno,
      String photo,
      String headline,
      String desc,
      String qualify,
      String cv,
      String gender,
      String adress,
      List skills) async {
    Firestore.instance.collection("teachers").document(email).setData({
      "uid": uid,
      "fname": fname,
      "lname": lname,
      "email": email,
      "password": password,
      "icno": icno,
      "country": country,
      "photo": photo,
      "headline": headline,
      "desc": desc,
      "qualify": qualify,
      "cv": cv,
      "gender": gender,
      "address": adress,
      "skills": skills,
      "countRate": "0.0",
      "stars": "0.0"
    });
  }

  searchByName(String searchField) {
    return Firestore.instance
        .collection('teachers')
        .where('headline', isEqualTo: searchField.substring(0, 1).toUpperCase())
        .where("icno", isEqualTo: "approved")
        .getDocuments();
  }
}
