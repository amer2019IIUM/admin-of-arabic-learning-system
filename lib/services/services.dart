import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  Future requestTutor(String idRequest, String emailTeacher,
      String emailStudent, String teacherName, String teacherPhoto) async {
    await Firestore.instance
        .collection('students_teachers')
        .document(idRequest)
        .setData({
      'idRequest': idRequest,
      'emailTeacher': emailTeacher,
      'emailStudent': emailStudent,
      "teacherName": teacherName,
      "teacherPhoto": teacherPhoto
    }).then((value) {});
  }

  Future approveRequest(
      String emailStudentemailTeacher, String emailTeacheremailStudent) async {
    await Firestore.instance
        .collection('students_teachers')
        .document(emailStudentemailTeacher)
        .collection('approve')
        .document(emailTeacheremailStudent);
    await Firestore.instance
        .collection('students_teachers')
        .document(emailStudentemailTeacher)
        .updateData({'approved': 'yes'}).then((value) {});
  }

  Future isItAprroved(String emailTeacheremailStudent) async {
    await Firestore.instance
        .collection('students_teachers')
        .document(emailTeacheremailStudent)
        .collection('approve')
        .document(emailTeacheremailStudent)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  Future denyRequest(String emailTeacheremailStudent) async {
    await Firestore.instance
        .collection('students_teachers')
        .document(emailTeacheremailStudent)
        .delete();
  }

  Future checkingRequest(String idRequest) async {
    return await Firestore.instance
        .collection('students_teachers')
        .document(idRequest)
        .get();
  }

  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    Firestore.instance
        .collection("students_teachers")
        .document(chatRoomId)
        .collection("approve")
        .document(chatRoomId)
        .setData(chatRoom)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future getConversationMessage(
      String chatRoomId, String sendBy, String message, dynamic time) async {
    await Firestore.instance
        .collection('students_teachers')
        .document(chatRoomId)
        .collection('approve')
        .document(chatRoomId)
        .collection('chats')
        .add({"message": message, "sendby": sendBy, "time": time, "type": 0});
  }

  Future getConversationMessagephoto(
      String chatRoomId, String sendBy, String photo, dynamic time) async {
    await Firestore.instance
        .collection('students_teachers')
        .document(chatRoomId)
        .collection('approve')
        .document(chatRoomId)
        .collection('chats')
        .add({
      "message": "",
      "photo": photo,
      "sendby": sendBy,
      "time": time,
      "type": 1
    });
  }

  Future getConversationMessage1(
      String chatRoomId, String sendBy, String message, dynamic time) async {
    await Firestore.instance
        .collection('chatRoom')
        .document(chatRoomId)
        .collection('chats')
        .add({"message": message, "sendby": sendBy, "time": time});
  }

  Future<bool> addChatRoom1(chatRoom, chatRoomId) {
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .setData(chatRoom)
        .catchError((e) {
      print(e.toString());
    });
  }

  // getMessages1(String chatRoomId) async {
  //   return Firestore.instance
  //       .collection("chatRoom")
  //       .document(chatRoomId)
  //       .collection("chats")
  //       .orderBy('time')
  //       .snapshots();
  // }

  Future getMessages(String chatRoomId) async {
    return await Firestore.instance
        .collection('students_teachers')
        .document(chatRoomId)
        .collection('approve')
        .document(chatRoomId)
        .collection('chats')
        .orderBy('time', descending: true)
        .snapshots();
  }

  Future studentID(String studentID) async {
    return await Firestore.instance
        .collection('students')
        .document(studentID)
        .get();
  }

  Future aPP(String idRequest) async {
    await Firestore.instance
        .collection('students_teachers')
        .document(idRequest)
        .collection('approve');
  }

  Future approvalRequest(String email) async {
    await Firestore.instance
        .collection("students_teachers")
        .document(email)
        .collection("approval")
        .document(email);
  }

  // Future denyRequest(String email) async {
  //   await Firestore.instance
  //       .collection('students_teachers')
  //       .document(email)
  //       .collection('deny')
  //       .document(email);
  // }

  getInfo(String email) async {
    return Firestore.instance.collection("students_teachers").document(email);
  }

  Future studentInf(String email, String name) async {
    await Firestore.instance
        .collection('st')
        .document(email)
        .setData({'email': email, 'name': name});
  }

  Future teacherInf(String email, String name) async {
    await Firestore.instance
        .collection('tch')
        .document(email)
        .setData({'email': email, 'name': name});
  }

  Future isItRequestedIt(String idRequest) async {
    return Firestore.instance
        .collection("students_teachers")
        .document(idRequest)
        .get();
  }

  Future isiIT() async {
    return Firestore.instance
        .collection("students_teachers")
        .document('am21mo@gmail.com')
        .get();
  }

  Future approve(String idRequest) async {
    return Firestore.instance
        .collection("students_teachers")
        .document(idRequest)
        .get();
  }

  Future setTimeMon(
    String teacherID,
    var monday,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("mon")
        .document("mon")
        .setData({
      "monday": monday,
    });
  }

  Future setTimeMonNull(
    String teacherID,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("mon")
        .document("mon")
        .setData({
      "monday": [
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null
      ],
    });
  }

  Future setTimeTus(
    String teacherID,
    var tuesday,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("tus")
        .document("tus")
        .setData({
      "tuesday": tuesday,
    });
  }

  Future setTimeTusNull(
    String teacherID,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("tus")
        .document("tus")
        .setData({
      "tuesday": [
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null
      ],
    });
  }

  Future setTimeWen(
    String teacherID,
    var wed,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("wen")
        .document("wen")
        .setData({
      "wednesday": wed,
    });
  }

  Future setTimeWenNull(
    String teacherID,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("wen")
        .document("wen")
        .setData({
      "wednesday": [
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null
      ],
    });
  }

  Future setTimeThru(
    String teacherID,
    var thr,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("thr")
        .document("thr")
        .setData({
      "thrusday": thr,
    });
  }

  Future setTimeThruNull(
    String teacherID,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("thr")
        .document("thr")
        .setData({
      "thrusday": [
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null
      ],
    });
  }

  Future setTimeFri(
    String teacherID,
    var fri,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("fri")
        .document("fri")
        .setData({
      "friday": fri,
    });
  }

  Future setTimeFriNull(
    String teacherID,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("fri")
        .document("fri")
        .setData({
      "friday": [
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null
      ],
    });
  }

  Future setTimeSa(
    String teacherID,
    var sa,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("sunday_saturday")
        .document("sunday_saturday")
        .updateData({
      "saturday": sa,
    });
  }

  Future setTimeSaSunNull(
    String teacherID,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("sunday_saturday")
        .document("sunday_saturday")
        .setData({
      "saturday": [
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null
      ],
      "sunday": [
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null
      ]
    });
  }

  Future setTimeSunday(
    String teacherID,
    var sun,
  ) async {
    await Firestore.instance
        .collection("teachersSchedule")
        .document(teacherID)
        .collection("sunday_saturday")
        .document("sunday_saturday")
        .updateData({
      "sunday": sun,
    });
  }

  Future getMon(String teacherEmail) async {
    return Firestore.instance
        .collection('teachersSchedule')
        .document(teacherEmail)
        .collection('mon')
        .snapshots();
  }

  Future getTus(String teacherEmail) async {
    return Firestore.instance
        .collection('teachersSchedule')
        .document(teacherEmail)
        .collection('tus')
        .snapshots();
  }

  Future getWen(String teacherEmail) async {
    return Firestore.instance
        .collection('teachersSchedule')
        .document(teacherEmail)
        .collection('wen')
        .snapshots();
  }

  Future getThr(String teacherEmail) async {
    return Firestore.instance
        .collection('teachersSchedule')
        .document(teacherEmail)
        .collection('thr')
        .snapshots();
  }

  Future getFri(String teacherEmail) async {
    return Firestore.instance
        .collection('teachersSchedule')
        .document(teacherEmail)
        .collection('fri')
        .snapshots();
  }

  Future getSunSa(String teacherEmail) async {
    return Firestore.instance
        .collection('teachersSchedule')
        .document(teacherEmail)
        .collection('sunday_saturday')
        .snapshots();
  }

  Future saveAmount(String amount) async {
    await Firestore.instance.collection('amount').add({"amount": amount});
  }

///////////////////////////////////////////////////////////
  Future buyingPurchase(String processID, int hasMints) async {
    await Firestore.instance
        .collection("packages")
        .document(processID)
        .setData({"hasMintues": hasMints});
  }

  Future hasMintues(String proccssID) async {
    return Firestore.instance.collection("packages").document(proccssID).get();
  }

  Future createpackageVoiding(String id) async {
    await Firestore.instance
        .collection("packages")
        .document(id)
        .setData({"hasMintues": 0});
  }

  Future getTeacherInfo(String teacherId) async {
    return await Firestore.instance.document(teacherId).get();
  }

  Future startChatSession() async {
    DateTime now = DateTime.now();
    int min = now.minute;
    print(min);
  }

  getstudentinfo(email) async {
    await Firestore.instance
        .collection("studentchatinfo")
        .document(email)
        .get();
  }
}
