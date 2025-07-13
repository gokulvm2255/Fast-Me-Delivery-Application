
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter_gvm/service/authservice.dart';
import 'package:project_flutter_gvm/service/customise_widget.dart';
import 'package:project_flutter_gvm/service/database.dart';
// import 'package:project_flutter_gvm/service/database.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Stream?  detailsStream;


  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Future<void> getOnTheLoad() async {
    detailsStream = await DatabaseFM().getuserdetails();
    setState(() {});
  }

  Widget alldetails(){
    return StreamBuilder(
      stream: detailsStream,
     builder: (context, AsyncSnapshot snapshot ){
      if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
          return const Center(child: Text(''));
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index){
            DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
            return Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                // margin: EdgeInsets.all(10),
                // margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [

                  InkWell(onTap: (){},
                        child: ClipOval(child: Image.asset('asset/images/profile.jpg',height: 120,width: 120,fit: BoxFit.cover,))),
                      SizedBox(height: 20,),
                      
                      Container(
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.person,color: Color.fromARGB(255, 40, 72, 234),size: 30.0,),
                                SizedBox(width: 10,),
                                Column(
                                  children: [
                                    Text("Name",style: Appwidget.simplelineTextstyle(),),
                                    Text("${documentSnapshot["Name"]}",style: Appwidget.headlineTextstyle(20),),
                                  ],
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),

                      Container(
                        child: Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.email_sharp,color: Color.fromARGB(255, 40, 72, 234),size: 30.0,),
                                SizedBox(width: 10,),
                                Column(
                                  children: [
                                    Text("Email",style: Appwidget.simplelineTextstyle(),),
                                    Text("${documentSnapshot["Email"]}",style: Appwidget.headlineTextstyle(20),),
                                  ],
                                ),
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      
                      InkWell(
                         onTap: () async{
                          await AuthService.logout();
                          Navigator.pushReplacementNamed(context, "/loginPage");
                        },
                        child: Container(
                          child: Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.logout_rounded,color: Color.fromARGB(255, 40, 72, 234),size: 30.0,),
                                  SizedBox(width: 10,),
                                  Text('Logout',style: Appwidget.headlineTextstyle(25),),
                                  SizedBox(width: 130),
                                   Icon(Icons.arrow_forward),
                                  SizedBox(width: 10,),
                                  Column(
                                    children: [
                                      
                        
                                    ],
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],



                ),
              ),
            );
          },
          );

     },
     );
  }







  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor:  Color.fromARGB(255, 40, 72, 234),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [

            Center(child: Text("Profile",style: Appwidget.anotherwhitetextstyle(25),),
            ),
      
            SizedBox(height: 20,),
            Expanded (
              child: Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                 decoration: BoxDecoration(color: Colors.white,
                 borderRadius:BorderRadius.only(
                  topLeft:Radius.circular(30),
                 topRight: Radius.circular(30),
                 ),
                 ),
                 child: SingleChildScrollView(
                   child: Column(
                    children: [
                      SizedBox(height: 20,),

                      alldetails(),
                   
                      ],
                    
                   ),
                 ),
              ),
            )
          ]
        )
        

      )
    );
  }
}







