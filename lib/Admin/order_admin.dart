import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter_gvm/service/customise_widget.dart';
import 'package:project_flutter_gvm/service/database.dart';

class AdminOrder extends StatefulWidget {
  const AdminOrder({super.key});

  @override
  State<AdminOrder> createState() => _AdminOrderState();
}

class _AdminOrderState extends State<AdminOrder> {
  Stream? orderStream;

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Future<void> getOnTheLoad() async {
    orderStream = await DatabaseFM().getAdminOrders();
    setState(() {});
  }

  Widget orderStatusButton(String text) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: Appwidget.anotherwhitetextstyle(20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  Widget orderConfirmationButton(String text) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          color:  Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.done,
                  color: Colors.black,
                )),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                text,
                style: Appwidget.anotherwhitetextstyle(20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }





  Widget allOrder() {
    return StreamBuilder(
      stream: orderStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
          return const Center(child: Text('No orders found'));
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return   Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        "asset/images/parcelsmall.png",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Drop-Off Address:",
                      style: Appwidget.headlineTextstyle(20),
                    ),
                    Text(
                      "Address: ${ds["DropoffAddress"]}",
                      style: Appwidget.normalineTextstyle(20),
                    ),
                    Text(
                      "Name: ${ds["DropoffUserName"]}",
                      style: Appwidget.normalineTextstyle(20),
                    ),
                    Text(
                      "Phone: ${ds["DropoffPhone"]}",
                      style: Appwidget.normalineTextstyle(20),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Pickup Address:",
                      style: Appwidget.headlineTextstyle(20),
                    ),
                    Text(
                      "Address: ${ds["PickUpAddress"]}",
                      style: Appwidget.normalineTextstyle(20),
                    ),
                    Text(
                      "Name: ${ds["PickUpUsername"]}",
                      style: Appwidget.normalineTextstyle(20),
                    ),
                    Text(
                      "Phone: ${ds["PickUpPhone"]}",
                      style: Appwidget.normalineTextstyle(20),
                    ),
                    const SizedBox(height: 10),

                   ds["Tracker"]>=0? orderConfirmationButton("Driver on the way to pickup point") : InkWell(
                      onTap: () async{
                        if(ds["Tracker"]== -1){



                        int updatedtracker = ds["Tracker"];
                       updatedtracker = updatedtracker+1;
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('The Process Has Been Completed',style: Appwidget.whitetextstyle(),),));
                        await DatabaseFM().updateAdminTracker(
                          ds.id,
                          updatedtracker);

                          // await DatabaseFM().updateUserTracker(
                          //   ds["UserId"], 
                          //   updatedtracker,
                          //   ds["OrderId"]);
                      }
                    },
                    
          
        
                      
                      child: orderStatusButton("Driver on the way to pickup point")),
                    const SizedBox(height: 10),

                   ds["Tracker"]>=1? orderConfirmationButton("Driver has arrived to pickup point") : InkWell(
                     onTap: () async{
                      if(ds["Tracker"]== 0){



                        int updatedtracker = ds["Tracker"];
                       updatedtracker = updatedtracker+1;
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('The Process Has Been Completed',style: Appwidget.whitetextstyle(),),));
                        await DatabaseFM().updateAdminTracker(
                          ds.id,
                          updatedtracker);

                          // await DatabaseFM().updateUserTracker(
                          //   ds["UserId"], 
                          //   updatedtracker,
                          //   ds["OrderId"]);
                      }
                      

                     },
                      child: orderStatusButton("Driver has arrived to pickup point")),
                    const SizedBox(height: 10),

                    ds["Tracker"]>=2? orderConfirmationButton("Parcel Collected") :InkWell(
                      onTap: ()async{
                        if(ds["Tracker"]== 1){



                        int updatedtracker = ds["Tracker"];
                       updatedtracker = updatedtracker+1;
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('The Process Has Been Completed',style: Appwidget.whitetextstyle(),),));
                        await DatabaseFM().updateAdminTracker(
                          ds.id,
                          updatedtracker);

                          // await DatabaseFM().updateUserTracker(
                          //   ds["UserId"], 
                          //   updatedtracker,
                          //   ds["OrderId"]);

                      }
                      },
                      child: orderStatusButton("Parcel Collected")),
                    const SizedBox(height: 10),

                   ds["Tracker"]>=3? orderConfirmationButton("Driver on the way to deliver destination") : InkWell(
                      onTap: ()async{
                        if(ds["Tracker"]== 2){



                        int updatedtracker = ds["Tracker"];
                       updatedtracker = updatedtracker+1;
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('The Process Has Been Completed',style: Appwidget.whitetextstyle(),),));
                        await DatabaseFM().updateAdminTracker(
                          ds.id,
                          updatedtracker);

                          // await DatabaseFM().updateUserTracker(
                          //   ds["UserId"], 
                          //   updatedtracker,
                          //   ds["OrderId"]);
                      }


                      },
                      child: orderStatusButton("Driver on the way to deliver destination")),
                    const SizedBox(height: 10),

                   ds["Tracker"]>=4? orderConfirmationButton("Parcel Delivered") : InkWell(
                      onTap: ()async{
                        if(ds["Tracker"]== 3){



                        int updatedtracker = ds["Tracker"];
                       updatedtracker = updatedtracker+1;
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text('The Process Has Been Completed',style: Appwidget.whitetextstyle(),),));
                        await DatabaseFM().updateAdminTracker(
                          ds.id,
                          updatedtracker);

                          // await DatabaseFM().updateUserTracker(
                          //   ds["UserId"], 
                          //   updatedtracker,
                          //   ds["OrderId"]);
                      }
                      },
                      child: orderStatusButton("Parcel Delivered")),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  } //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            
            SizedBox(height: 10,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Text(
                    "All Orders",
                    style: Appwidget.whitetextstyle(),
                    
                  ), SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, "/loginPage");
            }, child: Text("Logout")),
                  
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      allOrder(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}