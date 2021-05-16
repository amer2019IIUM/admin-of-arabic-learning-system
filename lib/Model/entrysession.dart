import 'package:cloud_firestore/cloud_firestore.dart';

class EntrySession {
  Future entrySessionData(String uid, String date, String email) async {
    try {
      DocumentReference docs =
          Firestore.instance.collection('entrysession').document(email);
      Map<String, String> data = {
        "uid": uid,
        "date": date,
        "email": email,
      };

      docs.setData(data).whenComplete(() => print('createsd'));
    } catch (e) {
      print(e.toString());
    }
  }
}
