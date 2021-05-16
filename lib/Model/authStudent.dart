import 'package:firebase_auth/firebase_auth.dart';
import 'package:siginsignup/Model/user.dart';

class AuthStudent {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  userAuthSt(FirebaseUser user) {
    UserStudent _userFromFirebaseUser(user) {
      return user != null ? UserStudent(uid: user.uid) : null;
    }
  }

  signout() async {
    _auth.signOut();
  }
}
