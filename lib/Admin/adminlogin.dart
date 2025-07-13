import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:project_flutter_gvm/service/authservice.dart';
import 'package:project_flutter_gvm/service/customise_widget.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // void submitForm(){
  //   if(formkey.currentState!.validate()){}
  // }
  // // String? validateEmail(value) {
  // //   if (value!.isEmpty) {
  // //     return 'Please enter Email';
  // //   } else if (!value.contains('@')) {
  // //     return 'Please Enter a Valid Email';
  // //   } else {
  // //     return null;
  // //   }
  // // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor:  Colors.white,
      
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 40, 72, 234),
      //   title: Center(child: Text("Fast Me Delivery",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w700,fontStyle: FontStyle.italic),)),),
      body: SingleChildScrollView(
        
        child: Container(
          
          margin: EdgeInsets.only(top: 130,right: 40,left: 40),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black),
          height: 500,
          width: 400,
        
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              
              children: [
                SizedBox(height: 40,),
                
                Center(child: Image.asset("asset/images/admin.png",height: 120,width: 120,fit: BoxFit.cover,)),
                Center(child: Text("Admin Login",style: Appwidget.whitetextstyle())),
                SizedBox(height: 50,),
                    
                
                
                TextFormField(
                  style: TextStyle(color: Colors.white),
                    controller: usernameController,
                    decoration:InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Username',style: Appwidget.diffwhitetextstyle(),),
                      hintText: 'Enter Your Username', 
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: passwordController,
                    decoration:InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Password',style: Appwidget.diffwhitetextstyle(),),
                      hintText: 'Enter Your password', 
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      loginAdmin();
                    
            
                    },
                    child: Center(
                      child: Container(
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color:Colors.white ),
                        child: Center(child: Text("Login",style: Appwidget.headlineTextstyle(25),),),
                        
                      
                      ),
                      
                    ),
                  ),
                  SizedBox(height: 20,),
            
                  
                
            
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      snapshot.docs.forEach((result){
        if(result.data()["username"]!=usernameController.text){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text('Wrong Username',style: Appwidget.whitetextstyle(),),));

        }
        else if(result.data()["password"]!=passwordController.text){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text('Wrong Password',style: Appwidget.whitetextstyle(),),));

        }
        else{
          Navigator.pushNamed(context, "/adminOrder");
        }
        

      });
    });
  }



}