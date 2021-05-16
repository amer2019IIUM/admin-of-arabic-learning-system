import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserISINCHATKey = "ISINCHAT";

  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";

  static String itRequestKey = "itRequest";
  static String chatRoomIdKey = "chatRoomId";
  static String sendByKey = "sendBy";
  static String teacherEmailKey = "teacherEmail";
  static String studentEmailKey = "studentEmail";
  static String startMinutesKey = "Key";

  /// saving data to sharedpreference
  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPreference(String userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserNameKey, userName);
  }

  static Future<bool> saveUserEmailSharedPreference(String userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, userEmail);
  }

  /// fetching data from sharedpreference
  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String> getUserNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserNameKey);
  }

  static Future<String> getUserEmailSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserEmailKey);
  }

  ///////////////////////////////////For chat Session/////////////////////
  static Future<bool> saveUserISINCHATSharedPreference(
      bool isUserISINCHAT) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceUserISINCHATKey, isUserISINCHAT);
  }

  static Future<bool> getUserISINCHATSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferenceUserISINCHATKey);
  }

  ///1 value
  static Future<bool> saveitRequest(String itRequest) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(itRequestKey, itRequest);
  }

  static Future<String> getitRequest() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(itRequestKey);
  }

  ///2 value
  static Future<bool> savechatRoomId(String chatRoomId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(chatRoomIdKey, chatRoomId);
  }

  static Future<String> getchatRoomId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(chatRoomIdKey);
  }

  ///3 value
  static Future<bool> savesendBy(String sendBy) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sendByKey, sendBy);
  }

  static Future<String> getsendBy() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sendByKey);
  }

  ///4 value
  static Future<bool> saveteacherEmail(String teacherEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(teacherEmailKey, teacherEmail);
  }

  static Future<String> getteacherEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(teacherEmailKey);
  }

  ///5 value
  static Future<bool> savestudentEmail(String studentEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(studentEmailKey, studentEmail);
  }

  static Future<String> getstudentEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(studentEmailKey);
  }

  ///6 value
  static Future<bool> savestartMinutes(String startMinutes) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(startMinutesKey, startMinutes);
    ///////////////////////////////////For chat Session/////////////////////
  }

  static Future<String> getstartMinutes() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(startMinutesKey);
  }

  /////////teacherID
  static Future<bool> saveAdminNotifacation(int number) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt("nu", number);
    ///////////////////////////////////For chat Session/////////////////////
  }

  static Future<int> getAdminNotifacation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getInt("nu");
  }

  static Future<bool> saveStudentName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString("name", name);
    ///////////////////////////////////For chat Session/////////////////////
  }

  static Future<String> getStudentName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString("name");
  }

  static Future<bool> saveStudentphoto(String photo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString("photo", photo);
    ///////////////////////////////////For chat Session/////////////////////
  }

  static Future<String> getStudentphoto() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString("photo");
  }
}
