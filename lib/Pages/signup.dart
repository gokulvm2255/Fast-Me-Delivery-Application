import 'package:flutter/material.dart';
import 'package:project_flutter_gvm/service/authservice.dart';
import 'package:project_flutter_gvm/service/customise_widget.dart';
import 'package:project_flutter_gvm/service/database.dart';
import 'package:project_flutter_gvm/service/shared_pref.dart';
import 'package:random_string/random_string.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
      //   toolbarHeight: 40,
      //   backgroundColor: const Color.fromARGB(255, 40, 72, 234),
      //   title: Center(child: Text("Fast Me Delivery",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),)),),
      body: SingleChildScrollView(
        

        
        child: Expanded(
          child: Container(
            
            
            margin: EdgeInsets.only(left: 20,right: 20,top: 100,bottom: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
            height: 620,
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
                        Text("Create \nAccount",style: TextStyle(fontSize: 45,fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 194, 84, 45,)),),
                        Image.asset("asset/images/delivery.png",height: 120,width: 120,fit: BoxFit.cover,),
                      ],
                    ),
                    SizedBox(height: 20,),
                        
                    Text("Sign Up",style: Appwidget.headlineTextstyle(25)),
                    SizedBox(height: 25,),
                    TextFormField(
                        controller: nameController,
                        decoration:InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Name'),
                          hintText: 'Enter Your Name', 
                        ),
                      ),
                      SizedBox(height: 20,),
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
                          String id = randomNumeric(10);
                          
                          
                          Map<String, dynamic> userInfoMap = {
                            "Name" : nameController.text,
                            "Email" : emailController.text,
                            "Id" : id,

                          };
                          await SharedPrefHelper().saveUserId(id);
                          await SharedPrefHelper().saveUserEmail(emailController.text);
                          await SharedPrefHelper().saveUserName(nameController.text);
                          await DatabaseFM().addUserDetail(userInfoMap, id);
                          formkey.currentState!.validate();

                          await AuthService.createEmailAndPassword(emailController.text, passwordController.text,nameController.text).then((value){
                            
                      if(value == "Account Created"){
                        Navigator.pushNamedAndRemoveUntil(context, "/bottomNavbar",(route) =>false );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('Signup Success',style: Appwidget.whitetextstyle(),),));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text('Signup Not Completed',style: Appwidget.whitetextstyle(),),));
                      }
                    });
          
                        },
                        child: Center(
                          child: Container(
                            height: 60,
                            width: 180,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:const Color.fromARGB(255, 40, 72, 234) ),
                            child: Center(child: Text("SignUp",style: Appwidget.whitetextstyle(),),),
                            
                          
                          ),
                          
                        ),
                      ),
                      SizedBox(height: 20,),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account? ",style: TextStyle(fontWeight: FontWeight.w500),),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("Log In",style: Appwidget.headlineTextstyle(15),))
                        ],
                      ),
                      
                    
                
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}