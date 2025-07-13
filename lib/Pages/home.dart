import 'package:flutter/material.dart';
import 'package:project_flutter_gvm/service/customise_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 5,backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 5.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on,color: const Color.fromARGB(255, 36, 131, 209),),
                          Text('Current Location',style: Appwidget.simplelineTextstyle(),),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Text('Sector 51,Gurugram,Bindapur',style: Appwidget.headlineTextstyle(19),)
                    ],
                  ),
                 
                ],
              ),
              SizedBox(height: 15,),
        
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 20.0,right: 20.0),
                height: MediaQuery.of(context).size.height/2.3,
                decoration: BoxDecoration(color:const Color.fromARGB(255, 40, 72, 234),borderRadius: BorderRadius.circular(30), ),
                child: Column(
                  children: [
                    SizedBox(height: 8,),
                    Text("Fast Me Delivery", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.white)),
                    SizedBox(height: 5),
                    Text("Welcome To Fast-Me Deliver Platform",style: Appwidget.diffwhitetextstyle(),),
                    SizedBox(height: 20,),
                    // Container(
                    //   padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    //   height: 60,
                    //   margin: EdgeInsets.all(15.0),
                    //   decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
                    //   child: TextField( 
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: 'Enter Your Tracking Number',
                    //       hintStyle: Appwidget.simplelineTextstyle(),
                    //       prefixIcon: Icon(Icons.airport_shuttle),
                    //     ),style: TextStyle(fontSize: 18),
                    //   ),
                    // ),
                    Image.asset("asset/images/deliverygroup.png",
                    height: 200),
                     
        
                   
                    
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Container(
                child: Column(
                  children: [
                    Text("Our Services",style: Appwidget.headlineTextstyle(25),),
                    Divider(thickness: 2,indent: 10,endIndent: 10,color: Colors.black45,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              
               Container(
                margin: EdgeInsets.only(left: 20.0,right: 20.0),
                 child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(30),
                   child: Container(
                    
                          width: MediaQuery.of(context).size.width,
                          decoration:BoxDecoration(
                            color: Colors.white,
                             borderRadius: BorderRadius.circular(30),
                             border: Border.all(color: Colors.black38,width: 3.0), 
                            ),
                          child: Row(
                            
                            children: [
                              Image.asset("asset/images/man.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text("Express Parcel",style: Appwidget.headlineTextstyle(20.0),),
                                  Container(
                                    width: MediaQuery.of(context).size.width/1.9,
                                    child: Text("Your Friendly Neighborhood Delivery Heroes Making Deliveries Catchy and Cool",style: Appwidget.simplelineTextstyle(),
                                    textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                 ),
               ),
        
               SizedBox(height: 20,),
               Container(
                margin: EdgeInsets.only(left: 20.0,right: 20.0),
                 child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(30),
                   child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    
                          width: MediaQuery.of(context).size.width,
                          decoration:BoxDecoration(
                            color: Colors.white,
                             borderRadius: BorderRadius.circular(30),
                             border: Border.all(color: Colors.black38,width: 3.0), 
                            ),
                          child: Row(
                            
                            children: [
                              Image.asset("asset/images/parcel.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text("International",style: Appwidget.headlineTextstyle(20.0),),
                                  Container(
                                    width: MediaQuery.of(context).size.width/1.9,
                                    child: Text("Fastme has an robust global network, shipping to 220+ destinations with offices in 7 countries—USA, Canada, UK, UAE, Singapore, Malaysia, and Australia",style: Appwidget.simplelineTextstyle(),
                                    textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                 ),
               ),
               SizedBox(height: 20,),

               Container(
                margin: EdgeInsets.only(left: 20.0,right: 20.0),
                 child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(30),
                   child: Container(
                    
                          width: MediaQuery.of(context).size.width,
                          decoration:BoxDecoration(
                            color: Colors.white,
                             borderRadius: BorderRadius.circular(30),
                             border: Border.all(color: Colors.black38,width: 3.0), 
                            ),
                          child: Row(
                            
                            children: [
                              Image.asset("asset/images/truckvan.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text("Check delivery history",style: Appwidget.headlineTextstyle(20.0),),
                                  Container(
                                    width: MediaQuery.of(context).size.width/1.9,
                                    child: Text("Check your delivery anytime to view details",style: Appwidget.simplelineTextstyle(),
                                    textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                 ),
               ),
        
               SizedBox(height: 30,),
               
            ], 
          ),
        ),
      ),
     
    );
  }
}