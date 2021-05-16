import 'package:cloud_firestore/cloud_firestore.dart';

class StudentTeacher {
  Future studentTeacher(String isaccept, String s_tID) async {
    Firestore.instance
        .collection('studentTeachers')
        .document(s_tID)
        .setData({'Isaccept': isaccept, 'id': s_tID});
  }
}
