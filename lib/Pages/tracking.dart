import 'package:flutter/material.dart';
import 'package:project_flutter_gvm/service/customise_widget.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Container(
         
        child: Column(
          children: [
            Image.asset("asset/images/delivery.png"),
            SizedBox(height: 20,),

            Text("Track your parcel\n from anytime",
            textAlign: TextAlign.center,
            style: Appwidget.headlineTextstyle(30  ),
            ),
            SizedBox(height: 10,),

            Text('Check the process\n of your delivery',
            textAlign: TextAlign.center,
            style: Appwidget.simplelineTextstyle(),
            ),
            SizedBox(height: 15.0,),

            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 178, 163, 26),
                  borderRadius: BorderRadius.circular(30),   
                ),
                child: Center(child: Text('Track Now',style: Appwidget.whitetextstyle(),)),
              ),
            ),


           
          ], 
        ),
      ),
    );
  }
}