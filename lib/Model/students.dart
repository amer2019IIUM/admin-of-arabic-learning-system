import 'package:cloud_firestore/cloud_firestore.dart';

class StudentsMod {
  Future studnetsData(String uid, String fname, String lname, String email,
      String password, String gender, String photo) async {
    try {
      DocumentReference docs =
          Firestore.instance.collection('students').document(uid);
      Map<String, String> data = {
        "uid": uid,
        "fname": fname,
        "lname": lname,
        "email": email,
        "password": password,
        "gender": gender,
        'photo': photo
      };

      docs.setData(data).whenComplete(() => print('createsd'));
    } catch (e) {
      print(e.toString());
    }
  }

  Future getStudentData(String uid) async {
    return Firestore.instance.collection("students").document(uid).get();
  }
}
