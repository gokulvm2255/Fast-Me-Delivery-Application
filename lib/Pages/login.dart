import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter_gvm/service/authservice.dart';
import 'package:project_flutter_gvm/service/customise_widget.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void submitForm(){
    if(formkey.currentState!.validate()){}
  }
  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter Email';
    } else if (!value.contains('@')) {
      return 'Please Enter a Valid Email';
    } else {
      return null;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 40, 72, 234),
      
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 40, 72, 234),
      //   title: Center(child: Text("Fast Me Delivery",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),)),),
      body: SingleChildScrollView(
        child: Container(
          
          
          margin: EdgeInsets.only(top: 100,left: 20,right: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
          height: 600,
          width: 400,
        
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Welcome \nBack",style: TextStyle(fontSize: 45,fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 194, 84, 45,)),),
                      Image.asset("asset/images/delivery.png",height: 120,width: 120,fit: BoxFit.cover,),
                    ],
                  ),
                  SizedBox(height: 50,),
                      
                  Text("Login",style: Appwidget.headlineTextstyle(25)),
                  SizedBox(height: 25,),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                     validator:validateEmail,
                      controller: emailController,
                      decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Email'),
                        hintText: 'Enter Your Email', 
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Password'),
                        hintText: 'Enter Your password', 
                      ),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: () async{

                        loginAdmin();
                        await AuthService.loginYourAccount(emailController.text, passwordController.text).then((value){
                    if(value == "Logged Successfully"){
                      Navigator.pushReplacementNamed(context, "/bottomNavbar");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('Login Success',style: Appwidget.whitetextstyle(),),));
                      
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text('Enter Correct Details',style: Appwidget.whitetextstyle(),),));
                    }

                    

                  });

                      },
                      child: Center(
                        child: Container(
                          height: 60,
                          width: 180,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:const Color.fromARGB(255, 40, 72, 234) ),
                          child: Center(child: Text("Login",style: Appwidget.whitetextstyle(),),),
                          
                        
                        ),
                        
                      ),
                    ),
                    SizedBox(height: 20,),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dont have an Account? ",style: TextStyle(fontWeight: FontWeight.w500),),
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, "/signupPage");
                        }, child: Text("Sign Up",style: Appwidget.headlineTextstyle(15),))
                      ],
                    )
                  
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  loginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      snapshot.docs.forEach((result){
        if(result.data()["username"]!=emailController.text){
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text('Wrong Username',style: Appwidget.whitetextstyle(),),));

        }
        else if(result.data()["password"]!=passwordController.text){
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text('Wrong Password',style: Appwidget.whitetextstyle(),),));

        }
        else{
          Navigator.pushNamed(context, "/adminOrder");
        }
        

      });
    });
  }
}