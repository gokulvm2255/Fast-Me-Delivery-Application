import 'package:firebase_auth/firebase_auth.dart';

class AuthService {


  static Future<String> createEmailAndPassword(
    String email, String password, String name) async{
      try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password,);
      return "Account Created";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> loginYourAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Logged Successfully";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  static Future logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
    
  }

static Future<bool> userLoggedCheck() async {
  var currentUser = FirebaseAuth.instance.currentUser;
  return currentUser!= null ? true : false;
}



















static Future delete()async{
  User? user= await FirebaseAuth.instance.currentUser;
  user?.delete();
}

}