import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter_gvm/Admin/adminlogin.dart';
import 'package:project_flutter_gvm/Admin/order_admin.dart';
import 'package:project_flutter_gvm/Pages/bottomnavbar.dart';
import 'package:project_flutter_gvm/Pages/login.dart';
import 'package:project_flutter_gvm/Pages/signup.dart';
import 'package:project_flutter_gvm/firebase_options.dart';
import 'package:project_flutter_gvm/service/authservice.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, 
      ),
      // home: AdminOrder(),
      routes: {
        "/" : (context) =>UserLogged(),
        "/loginPage" : (context) => Loginpage(),
        "/signupPage" : (context) => SignupPage(),
        "/bottomNavbar" : (context) => Bottomnavbar(),
         "/adminOrder" : (context) => AdminOrder(),
         "/userLogged" : (context) => UserLogged(),
         "/adminLogin" : (context) => Adminlogin()
        

        
        

      },
    );
  }
}

class UserLogged extends StatefulWidget {
  const UserLogged({super.key});

  @override
  State<UserLogged> createState() => _UserLogged();
}

class _UserLogged extends State<UserLogged> {

  @override
  void initState() {
    AuthService.userLoggedCheck().then((value){
      if(value){
        Navigator.pushReplacementNamed(context, "/bottomNavbar");
      }
      else{
        Navigator.pushReplacementNamed(context, "/loginPage");
      }

    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

